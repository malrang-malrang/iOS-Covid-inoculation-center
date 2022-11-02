//
//  CenterRequest.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation

struct CenterRequest: Encodable {
    let pageNumber: Int
    let perPages: Int
    var serviceKey: String {
        return Bundle.main.apiKey
    }
}
