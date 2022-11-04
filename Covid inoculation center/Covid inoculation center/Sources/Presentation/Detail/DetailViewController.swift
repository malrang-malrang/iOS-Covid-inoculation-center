//
//  DetailViewController.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit

final class DetailViewController: UIViewController {
    private let coordinator: DetailViewCoordinatorProtocol

    init(coordinator: DetailViewCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView() {
        self.view.backgroundColor = .systemBackground
    }
}
