//
//  DetailViewCoordinator.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit

protocol DetailViewCoordinatorProtocol {}

final class DetailViewCoordinator: Coordinator, DetailViewCoordinatorProtocol {
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

    func start(centerInformation: CenterInformation) {
        let detailViewModel = DetailViewModel(centerInformation: centerInformation)
        let detailView = DetailViewController(coordinator: self, viewModel: detailViewModel)
        self.navigationController.pushViewController(detailView, animated: true)
    }
}
