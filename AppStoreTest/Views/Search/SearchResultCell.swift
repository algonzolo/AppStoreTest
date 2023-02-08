//
//  SearchResultCell.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 30.01.2023.
//

import UIKit

class SearchResultCell: UICollectionViewCell {

    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingLabel.text = "Rating:\(String(format: "%.1f", appResult.averageUserRating ?? 0))"

            let url = URL(string: appResult.artworkUrl100)
            imageView.sd_setImage(with: url)
            screenshot1IV.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1 {
                screenshot2IV.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2 {
                screenshot3IV.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()

    let nameLabel = UILabel(text: "", font: .systemFont(ofSize: 18))
    let categoryLabel = UILabel(text: "", font: .systemFont(ofSize: 14))
    let ratingLabel = UILabel(text: "", font: .systemFont(ofSize: 14))

    let getbutton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.backgroundColor = UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 0.1)
        button.layer.cornerRadius = 16
        return button
    }()

    lazy var screenshot1IV = self.createScreenshotIV()
    lazy var screenshot2IV = self.createScreenshotIV()
    lazy var screenshot3IV = self.createScreenshotIV()

    private func createScreenshotIV() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.borderWidth = 0.5
        imageView.contentMode = .scaleAspectFill
        return imageView
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let labelsStack = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
        labelsStack.axis = .vertical

        let topInfoStack = UIStackView(arrangedSubviews: [imageView, labelsStack, getbutton])
        topInfoStack.spacing = 12
        topInfoStack.alignment = .center

        let screenshotStack = UIStackView(arrangedSubviews: [screenshot1IV, screenshot2IV, screenshot3IV])
        screenshotStack.spacing = 12
        screenshotStack.distribution = .fillEqually

        let overallStack = UIStackView(arrangedSubviews: [topInfoStack, screenshotStack])
        overallStack.axis = .vertical
        overallStack.spacing = 16

        addSubview(overallStack)
        overallStack.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
