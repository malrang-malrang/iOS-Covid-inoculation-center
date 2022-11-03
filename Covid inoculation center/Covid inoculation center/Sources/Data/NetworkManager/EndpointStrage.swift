//
//  EndpointStrage.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation

private enum Const {
    static let baseURL = "https://api.odcloud.kr/api"
    static let basePath = "/15077586/v1/centers"
}

enum EndPointStrage {
    case fetchCenterList(pageNumber: Int, perPages: Int)
}

extension EndPointStrage {
    var endpoint: Endpoint {
        switch self {
        case .fetchCenterList(pageNumber: let pageNumber, perPages: let perPages):
            return self.fetchCenterList(pageNumber: pageNumber, perPages: perPages)
        }
    }
}

extension EndPointStrage {
    private func fetchCenterList(pageNumber: Int, perPages: Int) -> Endpoint {
        let queryParameter = CenterRequest(
            pageNumber: pageNumber,
            perPages: perPages
        )

        let endpoint = Endpoint(
            host: Const.baseURL,
            path: Const.basePath,
            method: .get,
            queryParameters: queryParameter,
            serviceKey: Bundle.main.apiKey
        )

        return endpoint
    }
}
