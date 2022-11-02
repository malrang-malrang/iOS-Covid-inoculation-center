//
//  CenterInfomration.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/02.
//

import Foundation

struct CenterInformation: Decodable {
    let centerName: String?
    let facilityName: String?
    let address: String?
    let updateAt: String?
    let phoneNumber: String?
    let lat: String?
    let lng: String?
}
