//
//  AppsGroupCell.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 08.02.2023.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {

    static let id = "AppsGroupCell"
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 20))
    let horizontalController = AppsHorizontalController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
