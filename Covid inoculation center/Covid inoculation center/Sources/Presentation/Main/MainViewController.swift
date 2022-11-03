//
//  MainViewController.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

private enum Const {
    static let navigationTitle = "예방접종센터 리스트"
}

final class MainViewController: UIViewController {
    private let coordinator: MainViewCoordinatorProtocol
    private let disposeBag = DisposeBag()
    private let viewModel: MainViewModelable

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            CenterInformationCell.self,
            forCellReuseIdentifier: CenterInformationCell.identifier
        )
        return tableView
    }()

    init(coordinator: MainViewCoordinatorProtocol, viewModel: MainViewModelable) {
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
        self.viewModel.fetchCenterList()
    }

    private func setupNavigationItem() {
        self.navigationItem.title = Const.navigationTitle
    }

    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(self.tableView)
    }

    private func setupConstraint() {
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func bind() {
        self.viewModel.error
            .bind { [weak self] error in

            }
            .disposed(by: self.disposeBag)

        self.viewModel.isLoading
            .bind { [weak self] isLoading in

            }
            .disposed(by: self.disposeBag)

        self.viewModel.centerList
            .bind(to: self.tableView.rx.items) { tableView, row, element in
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CenterInformationCell.identifier,
                    for: IndexPath(row: row, section: .zero)
                ) as? CenterInformationCell else {
                    return UITableViewCell()
                }

                let cellViewModel = CenterInformationCellViewModel(centerInformation: element)
                cell.bind(viewModel: cellViewModel)
                return cell
            }
            .disposed(by: self.disposeBag)
    }
}
