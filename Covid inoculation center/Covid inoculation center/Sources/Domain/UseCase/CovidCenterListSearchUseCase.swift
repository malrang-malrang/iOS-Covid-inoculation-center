//
//  CovidCenterListSearchUseCase.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import RxSwift

protocol CovidCenterListSearchUseCaseProtocol {
    func fetchCenterList(pageNumber: Int, perPages: Int) -> Observable<CenterInformationList>
}

final class CovidCenterListSearchUseCase: CovidCenterListSearchUseCaseProtocol {
    private let covidInoculationCenterRepository: CovidInoculationCenterRepositoryProtocol

    init(covidInoculationCenterRepository: CovidInoculationCenterRepositoryProtocol) {
        self.covidInoculationCenterRepository = covidInoculationCenterRepository
    }

    func fetchCenterList(
        pageNumber: Int,
        perPages: Int
    ) -> RxSwift.Observable<CenterInformationList> {
        return self.covidInoculationCenterRepository.fetchCenterList(
            pageNumber: pageNumber,
            perPages: perPages
        )
    }
}
