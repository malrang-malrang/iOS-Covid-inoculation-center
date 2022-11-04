//
//  MapViewController.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit
import CoreLocation

import RxSwift
import RxCocoa
import SnapKit

private enum Const {
    static let toCurrentLocation = "현재위치로"
    static let toInoculationCenter = "접종센터로"
    static let map = "지도"
}

final class MapViewController: UIViewController, CLLocationManagerDelegate {
    private let coordinator: MapViewCoordinatorProtocol
    private let viewModel: MapViewModelable
    private let disposeBag = DisposeBag()
    private let mapView = MapView()
    private let locationManager = CLLocationManager()

    private let toCurrentLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle(Const.toCurrentLocation, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue

        return button
    }()

    private let toInoculationCenterButton: UIButton = {
        let button = UIButton()
        button.setTitle(Const.toInoculationCenter, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemRed

        return button
    }()

    init(coordinator: MapViewCoordinatorProtocol, viewModel: MapViewModelable) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraint()
        self.bind()
    }

    private func setupNavigationItem() {
        self.navigationItem.title = Const.map
        self.navigationItem.backButtonTitle = "Back"
    }

    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.view.addSubviews(
            self.mapView,
            self.toCurrentLocationButton
            , self.toInoculationCenterButton
        )
    }

    private func setupConstraint() {
        self.mapView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        self.toInoculationCenterButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            $0.height.equalToSuperview().multipliedBy(0.05)
        }

        self.toCurrentLocationButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.toInoculationCenterButton.snp.top).inset(-5)
            $0.height.equalToSuperview().multipliedBy(0.05)
        }
    }

    private func bind() {
        self.toInoculationCenterButton.rx.tap
            .bind(onNext: { [weak self] _ in
                
            })
            .disposed(by: self.disposeBag)

        self.toCurrentLocationButton.rx.tap
            .bind(onNext: { [weak self] _ in

            })
            .disposed(by: self.disposeBag)
    }
}
