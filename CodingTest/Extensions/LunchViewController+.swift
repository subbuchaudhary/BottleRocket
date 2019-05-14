//
//  LunchViewController+.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/14/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

// MARK: - CollectionView Delegates
extension LunchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.restaurant = restaurantList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - CollectionView DataSource
extension LunchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LunchViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LunchViewCell", for: indexPath) as! LunchViewCell
        cell.customView.backgroundColor = UIColor(patternImage: UIImage(named: "cellGradientBackground")!)
        cell.restaurantName.text = restaurantList[indexPath.row].name
        cell.categoryType.text = restaurantList[indexPath.row].category
        cell.backGroundImg.downloaded(from: restaurantList[indexPath.row].backgroundImageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (restaurantList.count > 0) ? restaurantList.count : 0
    }

}

// MARK: - CollectionView Layouts
extension LunchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: self.view.frame.size.width/2, height: 180)
        }
        return CGSize(width: self.view.frame.size.width, height: 180)
    }
    
}
