//
//  AppsGroupCell.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 08.02.2023.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {

    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 20))
    let horizontalController = UIViewController()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .lightGray
        addSubview(titleLabel)
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
