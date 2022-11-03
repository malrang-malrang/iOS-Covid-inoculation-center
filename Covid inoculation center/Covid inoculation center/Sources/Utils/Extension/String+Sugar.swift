//
//  String+Sugar.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import Foundation

extension String {
    func toDate() -> Date? {
        return Formatter.date.date(from: self)
    }
}
