//
//  CovidInoculationCenterRepositoryProtocol.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import RxSwift

protocol CovidInoculationCenterRepositoryProtocol {
    func fetchCenterList(pageNumber: Int, perPages: Int) -> Observable<CenterInformationList>
}
