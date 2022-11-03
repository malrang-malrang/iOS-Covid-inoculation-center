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
    func fetchCenterList()
    func fetchNextPage()
}

protocol MainViewModelOutput{
    var error: Observable<Error> { get }
    var isLoading: Observable<Bool> { get }
    var centerList: Observable<[CenterInformation]> { get }
}

final class MainViewModel: MainViewModelable {
    private let useCase: CovidCenterListSearchUseCaseProtocol
    private let disposeBag = DisposeBag()
    private var currentPage = 0
    private let isLoadingRelay = PublishRelay<Bool>()
    private let errorRelay = PublishRelay<Error>()
    private let centerListRelay = PublishRelay<[CenterInformation]>()
    private var previousCenterListResult: [CenterInformation] = []

    init(useCase: CovidCenterListSearchUseCaseProtocol) {
        self.useCase = useCase
    }

    // MARK: - Input

    func fetchCenterList() {
        self.isLoadingRelay.accept(true)
        self.useCase.fetchCenterList(pageNumber: self.currentPage, perPages: 10)
            .withUnretained(self)
            .subscribe(onNext: { viewModel, centerList in
                viewModel.centerListRelay.accept(viewModel.previousCenterListResult + centerList.data)
                viewModel.previousCenterListResult.append(contentsOf: centerList.data)
            }, onError: { [weak self] error in
                self?.errorRelay.accept(error)
            }, onCompleted: {
                self.isLoadingRelay.accept(false)
            })
            .disposed(by: self.disposeBag)
    }

    func fetchNextPage() {
        self.currentPage += 1
        self.fetchCenterList()
    }

    // MARK: - Output

    var error: Observable<Error> {
        return self.errorRelay.asObservable()
    }

    var isLoading: Observable<Bool> {
        return self.isLoadingRelay.asObservable()
    }

    var centerList: Observable<[CenterInformation]> {
        return self.centerListRelay.asObservable()
    }
}
