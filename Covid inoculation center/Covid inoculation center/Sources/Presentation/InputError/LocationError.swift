//
//  LocationError.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/05.
//

import Foundation

enum LocationError: LocalizedError {
case deniedError
case restrictedError
case notDetermined
case unknown

    var errorMessage: String {
        switch self {
        case .deniedError:
            return "현재 위치를 사용하기 위해 위치 권한이 필요합니다."
        case .restrictedError:
            return "현재 위치를 사용하기 위해 위치 권한이 필요합니다."
        case .notDetermined:
            return "현재 위치를 사용하기 위해 위치 권한이 필요합니다."
        case .unknown:
            return "알수없는 에러가 발생했습니다."
        }
    }
}
