//
//  CenterInformationCell.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/03.
//

import UIKit

private enum Const {
    static let centerName = "센터명"
    static let facilityName = "건물명"
    static let address = "주소"
    static let updateAt = "업데이트 시간"
}

final class CenterInformationCell: UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    private let placeHolderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10

        return stackView
    }()

    private let centerNamePlaceHolderLabel: UILabel = {
        let label = UILabel()
        label.text = Const.centerName
        label.textColor = .systemGray2
        label.font = .preferredFont(forTextStyle: .footnote)
        
        return label
    }()

    private let facilityNamePlaceHolderLabel: UILabel = {
        let label = UILabel()
        label.text = Const.facilityName
        label.textColor = .systemGray2
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    private let addressPlaceHolderLabel: UILabel = {
        let label = UILabel()
        label.text = Const.address
        label.textColor = .systemGray2
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    private let updateAtPlaceHolderLabel: UILabel = {
        let label = UILabel()
        label.text = Const.updateAt
        label.textColor = .systemGray2
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    private let informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10

        return stackView
    }()

    private let centerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    private let facilityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    private let updateAtLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContentView()
        self.setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContentView() {
        self.contentView.backgroundColor = .systemBackground
        self.contentView.addSubviews(self.placeHolderStackView, self.informationStackView)
        self.placeHolderStackView.addArrangedSubviews(
            self.centerNamePlaceHolderLabel,
            self.facilityNamePlaceHolderLabel,
            self.addressPlaceHolderLabel,
            self.updateAtPlaceHolderLabel
        )
        self.informationStackView.addArrangedSubviews(
            self.centerNameLabel,
            self.facilityNameLabel,
            self.addressLabel,
            self.updateAtLabel
        )
    }

    private func setupConstraint() {
        self.placeHolderStackView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }

        self.informationStackView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(self.placeHolderStackView.snp.trailing)
        }
    }

    func bind(viewModel: CenterInformationCellViewModelable) {
        self.centerNameLabel.text = viewModel.centerName
        self.facilityNameLabel.text = viewModel.facilityName
        self.addressLabel.text = viewModel.address
        self.updateAtLabel.text = viewModel.updatedAt
    }
}
