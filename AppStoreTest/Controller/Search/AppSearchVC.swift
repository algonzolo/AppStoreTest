//
//  AppSearchVC.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 30.01.2023.
//

import UIKit
import SDWebImage

class AppSearchVC: BaseListController, UISearchBarDelegate {

    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate var appResults = [Result]()
    var timer: Timer?

    fileprivate let searchTermLabel = UILabel(text:"Please enter search term above...", font: .boldSystemFont(ofSize: 20))

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.id)
        collectionView.addSubview(searchTermLabel)
        searchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        setupSearchBar()
    }

//    fileprivate func fetchITunesDataApps() {
//        Service.shared.fetchApps(searchTerm: "Twitter") { (results) in
//            self.appResults = results
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//    }

    fileprivate func setupSearchBar() {
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { result in
                self.appResults = result
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.id, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
        return cell
    }

}

extension AppSearchVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }

}
