//
//  CircleButton.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/04.
//

import UIKit

final class CircleButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            self.didTapButtonAnimation()
        }
    }

    init(image: UIImage?) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.setupButton(image: image)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
      }

    private func setupButton(image: UIImage?) {
        self.backgroundColor = .systemBackground
        self.setImage(image, for: .normal)
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
