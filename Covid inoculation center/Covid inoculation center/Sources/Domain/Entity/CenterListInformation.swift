//
//  CenterListInformation.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation

struct CenterListInformation: Decodable {
    let pageNumber: Int
    let perPages: Int
    let data: [CenterInformation]

    private enum CodingKeys: String, CodingKey {
        case pageNumber = "page"
        case perPages = "perPage"
        case data
    }
}
