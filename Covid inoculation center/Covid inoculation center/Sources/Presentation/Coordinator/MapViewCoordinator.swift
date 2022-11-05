//
//  MapViewCoordinator.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit

protocol MapViewCoordinatorProtocol: Alertable {}

final class MapViewCoordinator: Coordinator, MapViewCoordinatorProtocol {
    var navigationController: UINavigationController
    var parentCoordinators: Coordinator?
    var childCoordinators: [Coordinator] = []
    private let covidCenterListSearchUseCase: CovidCenterListSearchUseCaseProtocol

    init(
        navigationController: UINavigationController,
        parentCoordinators: Coordinator? = nil,
        childCoordinators: [Coordinator] = [],
        covidCenterListSearchUseCase: CovidCenterListSearchUseCaseProtocol
    ) {
        self.navigationController = navigationController
        self.parentCoordinators = parentCoordinators
        self.covidCenterListSearchUseCase = covidCenterListSearchUseCase
    }

    func start(latitude: String?, longitude: String?, centerName: String?) {
        let viewModel = MapViewModel(latitude: latitude, longitude: longitude, centerName: centerName)
        let mapView = MapViewController(coordinator: self, viewModel: viewModel)
        self.navigationController.pushViewController(mapView, animated: true)
    }
}
