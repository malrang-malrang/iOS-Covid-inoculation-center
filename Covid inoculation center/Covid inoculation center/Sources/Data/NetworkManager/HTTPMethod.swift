//
//  HTTPMethod.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"

    var value: String {
        return self.rawValue
    }
}
