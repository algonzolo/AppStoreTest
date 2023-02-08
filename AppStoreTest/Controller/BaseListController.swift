//
//  BaseListController.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 08.02.2023.
//

import UIKit

class BaseListController: UICollectionViewController {

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

