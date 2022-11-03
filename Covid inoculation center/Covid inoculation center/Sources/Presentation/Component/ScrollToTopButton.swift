//
//  ScrollToTopButton.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit

private enum Image {
    static let topAlignment = UIImage(named: "top-alignment")
}

final class ScrollToTopButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            self.didTapButtonAnimation()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
      }

    private func setupButton() {
        self.backgroundColor = .systemBackground
        self.setImage(Image.topAlignment, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
    }

    private func didTapButtonAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            self.transform = CGAffineTransform.identity
        }
    }
}
