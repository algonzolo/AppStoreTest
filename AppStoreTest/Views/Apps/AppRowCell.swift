//
//  AppRowCell.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 09.02.2023.
//

import UIKit

class AppRowCell: UICollectionViewCell {

    static let id = "AppRowCell"

    let imageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 12))
    let getButton = UIButton(title: "GET")


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .purple

        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainHeight(constant: 32)
        getButton.constrainWidth(constant: 80)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        let vStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel])
        vStackView.axis = .vertical
        vStackView.spacing = 4

        let stackView = UIStackView(arrangedSubviews: [imageView, vStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
