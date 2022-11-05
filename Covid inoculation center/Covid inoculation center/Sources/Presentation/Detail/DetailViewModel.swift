//
//  DetailViewModel.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import Foundation

private enum Const {
    static let unknown = "정보를 가져올수 없습니다."
}

protocol DetailViewModelable: DetailViewModelOutput {}

protocol DetailViewModelOutput {
    var centerName: String { get }
    var facilityName: String { get }
    var phoneNumber: String { get }
    var updatedAt: String { get }
    var address: String { get }
    var latitude: String { get }
    var longitude: String { get }
}

final class DetailViewModel: DetailViewModelable {
    private let centerInformation: CenterInformation

    init(centerInformation: CenterInformation) {
        self.centerInformation = centerInformation
    }

    // MARK: - Output

    var centerName: String {
        return self.centerInformation.centerName ?? Const.unknown
    }

    var facilityName: String {
        return self.centerInformation.facilityName ?? Const.unknown
    }

    var phoneNumber: String {
        return self.centerInformation.phoneNumber ?? Const.unknown
    }

    var updatedAt: String {
        return self.centerInformation.updatedAt ?? Const.unknown
    }

    var address: String {
        return self.centerInformation.address ?? Const.unknown
    }

    var latitude: String {
        return self.centerInformation.lat ?? Const.unknown
    }

    var longitude: String {
        return self.centerInformation.lng ?? Const.unknown
    }
}
