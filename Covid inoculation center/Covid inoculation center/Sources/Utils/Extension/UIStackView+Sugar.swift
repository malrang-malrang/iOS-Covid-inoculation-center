//
//  UIStackView+Sugar.swift
//  Covid inoculation center
//
//  Created by 김동욱 on 2022/11/03.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ view: UIView...) {
        view.forEach {
            self.addArrangedSubview($0)
        }
    }
}
