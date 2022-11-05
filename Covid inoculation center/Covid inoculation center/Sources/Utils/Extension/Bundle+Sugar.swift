//
//  Bundle+Sugar.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "CovidInoculationCenterInfo", ofType: "plist") else {
            return ""
        }

        guard let resource = NSDictionary(contentsOfFile: file) else {
            return ""
        }

        guard let key = resource["API_KEY"] as? String else {
            fatalError("Covid inoculation center의 API_KEY를 가져올수 없습니다.")
        }

        return key
    }
}
