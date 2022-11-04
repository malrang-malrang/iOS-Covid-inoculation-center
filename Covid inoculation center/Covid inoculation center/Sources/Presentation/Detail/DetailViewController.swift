//
//  DetailViewController.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//
import UIKit

import RxSwift
import SnapKit

private enum Const {
    static let map = "지도"
}

final class DetailViewController: UIViewController {
    private let viewModel: DetailViewModelable
    private let coordinator: DetailViewCoordinatorProtocol
    private let disposeBag = DisposeBag()
    private let contentsView: DetailContentsView

    private let mapBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: Const.map)

        return barButton
    }()

    init(coordinator: DetailViewCoordinatorProtocol, viewModel: DetailViewModelable) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        self.contentsView = DetailContentsView(
            coordinator: coordinator,
            viewModel: viewModel
        )
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationItem()
        self.setupView()
        self.setupConstraint()
    }

    private func setupNavigationItem() {
        self.navigationItem.title = self.viewModel.centerName
        self.navigationItem.rightBarButtonItem = self.mapBarButton
    }

    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.contentsView)
    }

    private func setupConstraint() {
        self.contentsView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func bind() {
        self.mapBarButton.rx.tap
            .bind(onNext: { [weak self] _ in
                //                self?.coordinator.showMapView()
            })
            .disposed(by: self.disposeBag)
    }

}
