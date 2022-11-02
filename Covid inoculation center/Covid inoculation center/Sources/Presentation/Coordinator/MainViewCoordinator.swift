//
//  MainViewCoordinator.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import UIKit

protocol MainViewCoordinatorProtocol {}

final class MainViewCoordinator: Coordinator, MainViewCoordinatorProtocol {
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

    func start() {}
}
