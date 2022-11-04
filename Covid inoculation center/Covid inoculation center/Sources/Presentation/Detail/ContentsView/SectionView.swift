//
//  SectionStackView.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit

import SnapKit

final class SectionView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center

        return label
    }()

    private let informationLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 2
        label.textAlignment = .center

        return label
    }()

    init(image: UIImage?, title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.setImage(image: image)
        self.setTitle(title: title)
        self.setupView()
        self.setupConstraint()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 9
    }

    private func setImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }

    private func setTitle(title: String?) {
        self.titleLabel.text = title
    }

    private func setupView() {
//        self.axis = .vertical
//        self.alignment = .center
//        self.distribution = .equalSpacing
//        self.spacing = 1
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5

        self.addSubviews(
            self.imageView,
            self.titleLabel,
            self.informationLabel
        )
    }

    private func setupConstraint() {
        self.imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.3)
            $0.width.equalTo(self.imageView.snp.height)
        }

        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }

        self.informationLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
        }
    }

    func bind(information: String) {
        self.informationLabel.text = information
    }
}

