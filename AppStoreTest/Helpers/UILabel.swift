//
//  UILabel.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 08.02.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}
