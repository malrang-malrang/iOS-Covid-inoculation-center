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
    private let detailContentsView = DetailContentsView()

    private let mapBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: Const.map)

        return barButton
    }()

    init(coordinator: DetailViewCoordinatorProtocol, viewModel: DetailViewModelable) {
        self.coordinator = coordinator
        self.viewModel = viewModel
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
        self.bind()
    }

    private func setupNavigationItem() {
        self.navigationItem.title = self.viewModel.centerName
        self.navigationItem.rightBarButtonItem = self.mapBarButton
    }

    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.detailContentsView)
    }

    private func setupConstraint() {
        self.detailContentsView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func bind() {
        self.detailContentsView.bind(
            centerName: self.viewModel.centerName,
            facilityName: self.viewModel.facilityName,
            phoneNumber: self.viewModel.phoneNumber,
            updatedAt: self.viewModel.updatedAt,
            address: self.viewModel.address
        )

        self.mapBarButton.rx.tap
            .bind(onNext: { [weak self] _ in
                self?.coordinator.showMapView(
                    latitude: self?.viewModel.latitude,
                    longitude: self?.viewModel.longitude,
                    centerName: self?.viewModel.centerName
                )
            })
            .disposed(by: self.disposeBag)
    }
}
