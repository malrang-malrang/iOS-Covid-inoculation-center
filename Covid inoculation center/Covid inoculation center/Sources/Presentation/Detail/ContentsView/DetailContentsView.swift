//
//  DetailContentsView.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit

private enum Const {
    static let centerName = "센터명"
    static let facilityName = "건물명"
    static let phoneNumber = "전화번호"
    static let updatedAt = "업데이트 시간"
    static let address = "주소"
}


final class DetailContentsView: UIView {
    private let centerNameSectionView = SectionView(
        image: Image.hospital,
        title: Const.centerName
    )

    private let facilityNameSectionView = SectionView(
        image: Image.building,
        title: Const.facilityName
    )

    private let phoneNumberSectionView = SectionView(
        image: Image.telephone,
        title: Const.phoneNumber
    )

    private let updateAtSectionView = SectionView(
        image: Image.chat,
        title: Const.updatedAt
    )

    private let addressSectionView = SectionView(
        image: Image.placeholder,
        title: Const.address
    )


    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.setupView()
        self.setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = .systemGray5
        self.addSubviews(
            self.centerNameSectionView,
            self.facilityNameSectionView,
            self.phoneNumberSectionView,
            self.updateAtSectionView,
            self.addressSectionView
        )
    }

    private func setupConstraint() {
        self.centerNameSectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalTo(self.centerNameSectionView.snp.width)
        }

        self.facilityNameSectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalTo(self.facilityNameSectionView.snp.width)
        }

        self.phoneNumberSectionView.snp.makeConstraints {
            $0.top.equalTo(self.centerNameSectionView.snp.bottom).offset(20)
            $0.leading.equalTo(self.centerNameSectionView.snp.leading)
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalTo(self.phoneNumberSectionView.snp.width)
        }

        self.updateAtSectionView.snp.makeConstraints {
            $0.top.equalTo(self.facilityNameSectionView.snp.bottom).offset(20)
            $0.trailing.equalTo(self.facilityNameSectionView.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalTo(self.updateAtSectionView.snp.width)
        }

        self.addressSectionView.snp.makeConstraints {
            $0.top.equalTo(self.phoneNumberSectionView.snp.bottom).offset(20)
            $0.leading.equalTo(self.phoneNumberSectionView.snp.leading)
            $0.trailing.equalTo(self.updateAtSectionView.snp.trailing)
            $0.height.equalTo(self.facilityNameSectionView.snp.height)
        }
    }

    func bind(
        centerName: String,
        facilityName: String,
        phoneNumber: String,
        updatedAt: String,
        address: String
    ) {
        self.centerNameSectionView.bind(information: centerName)
        self.facilityNameSectionView.bind(information: facilityName)
        self.phoneNumberSectionView.bind(information: phoneNumber)
        self.updateAtSectionView.bind(information: updatedAt)
        self.addressSectionView.bind(information: address)
    }
}
