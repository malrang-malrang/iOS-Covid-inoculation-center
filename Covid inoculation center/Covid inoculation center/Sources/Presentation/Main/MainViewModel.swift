//
//  MainViewModel.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/03.
//

import RxSwift
import RxRelay

protocol MainViewModelable: MainViewModelInput, MainViewModelOutput {}

protocol MainViewModelInput {
    func fetchFirstPage()
    func fetchNextPage(indexPath: Int?)
}

protocol MainViewModelOutput{
    var error: Observable<Error> { get }
    var centerList: Observable<[CenterInformation]> { get }
}

final class MainViewModel: MainViewModelable {
    private let useCase: CovidCenterListSearchUseCaseProtocol
    private let disposeBag = DisposeBag()
    private var currentPage = 1
    private let errorRelay = PublishRelay<Error>()
    private let centerListRelay = BehaviorRelay<[CenterInformation]>(value: [])

    init(useCase: CovidCenterListSearchUseCaseProtocol) {
        self.useCase = useCase
    }

    private func fetchCenterList() {
        self.useCase.fetchCenterList(pageNumber: self.currentPage, perPages: 10)
            .withUnretained(self)
            .subscribe(onNext: { viewModel, centerList in
                viewModel.centerListRelay.accept(viewModel.centerListRelay.value + centerList.data)
            }, onError: { [weak self] error in
                self?.errorRelay.accept(error)
            })
            .disposed(by: self.disposeBag)
    }

    // MARK: - Input

    func fetchFirstPage() {
        self.currentPage = 1
        self.centerListRelay.accept([])
        self.fetchCenterList()
    }

    func fetchNextPage(indexPath: Int?) {
        guard indexPath == self.centerListRelay.value.count - 1 else {
            return
        }

        self.currentPage += 1
        self.fetchCenterList()
    }

    // MARK: - Output

    var error: Observable<Error> {
        return self.errorRelay.asObservable()
    }

    var centerList: Observable<[CenterInformation]> {
        return self.centerListRelay.asObservable()
    }
}
