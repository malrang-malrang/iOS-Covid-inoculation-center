//
//  CovidInoculationCenterRepository.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import RxSwift

final class CovidInoculationCenterRepository: CovidInoculationCenterRepositoryProtocol {
    private let networkManger: Networkable

    init(networkManger: Networkable = NetworkManager()) {
        self.networkManger = networkManger
    }

    func fetchCenterList(pageNumber: Int, perPages: Int) -> Observable<CenterInformation> {
        let endpoint = EndPointStrage
            .fetchCenterList(pageNumber: pageNumber, perPages: perPages)
            .endpoint

        return self.networkManger.request(endPoint: endpoint)
            .decode(type: CenterInformation.self, decoder: Json.decoder)
    }
}
