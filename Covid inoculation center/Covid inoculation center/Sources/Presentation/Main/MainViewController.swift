//
//  MainViewController.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation
final class MainViewController: UIViewController {
    private let coordinator: MainViewCoordinatorProtocol
    init(coordinator: MainViewCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
