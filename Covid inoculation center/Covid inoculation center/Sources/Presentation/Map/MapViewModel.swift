//
//  MapViewModel.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import CoreLocation

import RxSwift
import RxRelay

private enum Const {
    static let unknown = "정보를 가져올수 없습니다."
}

protocol MapViewModelable: MapViewModelInput, MapViewModelOutput {}

protocol MapViewModelInput {
    func locationRegistration(location: CLLocation?)
    func didTapToInoculationCenterButton()
    func didTapToCurrentLocationButton(authorization: CLAuthorizationStatus)
}

protocol MapViewModelOutput {
    var error: Observable<LocationError> { get }
    var moveToCenterLocation: Observable<(CLLocationCoordinate2D, String)> { get }
    var moveToCurrentLocation: Observable<CLLocationCoordinate2D> { get }
    var requestLocationAuthority: Observable<Void> { get }
}

final class MapViewModel: MapViewModelable {
    private var currentLocation: CLLocationCoordinate2D?
    private let centerLocation: CLLocationCoordinate2D
    private let centerName: String
    private let moveToCenterLocationRelay = PublishRelay<(CLLocationCoordinate2D, String)>()
    private let moveToCurrentLocationRelay = PublishRelay<CLLocationCoordinate2D>()
    private let errorRelay = PublishRelay<LocationError>()
    private let requestLocationAuthorityRelay = PublishRelay<Void>()

    init(latitude: String?, longitude: String?, centerName: String?) {
        let latitude = Double(latitude ?? Const.unknown) ?? .zero
        let longitude = Double(longitude ?? Const.unknown) ?? .zero
        self.centerLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.centerName = centerName ?? Const.unknown
    }

    // MARK: - Input

    func didTapToInoculationCenterButton() {
        self.moveToCenterLocationRelay.accept((self.centerLocation, self.centerName))
    }

    func didTapToCurrentLocationButton(authorization: CLAuthorizationStatus) {
        switch authorization {
        case .notDetermined:
            self.errorRelay.accept(.notDetermined)
            self.requestLocationAuthorityRelay.accept(())
        case .restricted:
            self.errorRelay.accept(.restrictedError)
            self.requestLocationAuthorityRelay.accept(())
        case .denied:
            self.errorRelay.accept(.deniedError)
            self.requestLocationAuthorityRelay.accept(())
        case .authorizedAlways, .authorizedWhenInUse:
            guard let currentLocation = self.currentLocation else {
                return self.requestLocationAuthorityRelay.accept(())
            }
            self.moveToCurrentLocationRelay.accept(currentLocation)
        @unknown default:
            self.errorRelay.accept(.unknown)
        }
    }

    func locationRegistration(location: CLLocation?) {
        guard let location = location else {
            return self.requestLocationAuthorityRelay.accept(())
        }

        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let currentLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.currentLocation = currentLocation
        self.moveToCurrentLocationRelay.accept(currentLocation)
    }

    // MARK: - Output

    var error: Observable<LocationError> {
        return self.errorRelay.asObservable()
    }

    var moveToCenterLocation: Observable<(CLLocationCoordinate2D, String)> {
        return self.moveToCenterLocationRelay.asObservable()
    }

    var moveToCurrentLocation: Observable<CLLocationCoordinate2D> {
        return self.moveToCurrentLocationRelay.asObservable()
    }

    var requestLocationAuthority: Observable<Void> {
        return self.requestLocationAuthorityRelay.asObservable()
    }
}
