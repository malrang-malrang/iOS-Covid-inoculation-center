//
//  CenterInformationCellViewModel.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/03.
//

import Foundation

private enum Const {
    static let unknown = "정보를 알수 없습니다."
}

protocol CenterInformationCellViewModelable: CenterInformationCellOutput {}

protocol CenterInformationCellOutput {
    var centerName: String { get }
    var facilityName: String { get }
    var address: String { get }
    var updatedAt: String { get }
}

final class CenterInformationCellViewModel: CenterInformationCellViewModelable {
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

    var address: String {
        return self.centerInformation.address ?? Const.unknown
    }

    var updatedAt: String {
        return self.centerInformation.updatedAt ?? Const.unknown
    }
}
