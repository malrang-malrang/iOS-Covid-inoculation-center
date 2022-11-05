//
//  Endpoint.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation

final class Endpoint: Requestable {
    var host: String
    var path: String
    var method: HttpMethod
    var queryParameters: Encodable?
    var serviceKey: String?

    init(
        host: String,
        path: String = "",
        method: HttpMethod = .get,
        queryParameters: Encodable? = nil,
        serviceKey: String? = nil
    ) {
        self.host = host
        self.path = path
        self.method = method
        self.queryParameters = queryParameters
        self.serviceKey = serviceKey
    }
}
