//
//  MapView.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import MapKit

final class MapView: MKMapView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.showsUserLocation = true
    }

    func setLocationPin(location: CLLocationCoordinate2D, title: String) {
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = title
        self.addAnnotation(pin)
    }

    func moveLocation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(
            center: location,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        self.setRegion(region, animated: true)
    }
}
