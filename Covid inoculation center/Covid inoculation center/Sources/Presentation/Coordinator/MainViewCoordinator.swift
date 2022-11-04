//
//  MainViewCoordinator.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import UIKit

protocol MainViewCoordinatorProtocol: Alertable {
    func showDetailView(centerInformation: CenterInformation)
}

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

    func start() {
        let centerListViewModel = MainViewModel(useCase: self.covidCenterListSearchUseCase)
        let mainView = MainViewController(coordinator: self, viewModel: centerListViewModel)
        self.navigationController.pushViewController(mainView, animated: true)
    }

    func showDetailView(centerInformation: CenterInformation) {
        let detailCoordinaor = DetailViewCoordinator(
            navigationController: self.navigationController,
            parentCoordinators: self,
            covidCenterListSearchUseCase: self.covidCenterListSearchUseCase
        )
        self.childCoordinators.append(detailCoordinaor)
        detailCoordinaor.start(centerInformation: centerInformation)
    }
}
