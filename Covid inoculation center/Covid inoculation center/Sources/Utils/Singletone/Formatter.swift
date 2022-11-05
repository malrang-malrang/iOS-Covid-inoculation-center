//
//  Formatter.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/03.
//

import Foundation

struct Formatter {
    static let date: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return dateFormatter
    }()

    private init() {}
}
