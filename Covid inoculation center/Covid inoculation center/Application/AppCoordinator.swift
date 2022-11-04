//
//  AppCoordinator.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import UIKit
import CoreLocation

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var parentCoordinators: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
    func removeChild(_ coordinator: Coordinator) {
        self.childCoordinators.removeAll()
    }
}

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinators: Coordinator?
    var childCoordinators: [Coordinator] = []
    var locationManager = CLLocationManager()
    private let covidCenterListSearchUseCase = CovidCenterListSearchUseCase(
        covidInoculationCenterRepository: CovidInoculationCenterRepository()
    )

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainCoordinator = MainViewCoordinator(
            navigationController: self.navigationController,
            parentCoordinators: self,
            covidCenterListSearchUseCase: self.covidCenterListSearchUseCase
        )
        self.childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}
