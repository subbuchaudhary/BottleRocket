//
//  LunchViewController.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/13/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class LunchViewController: UIViewController {

    @IBOutlet weak var collectnView: UICollectionView!
    var restaurantList: [Restaurants] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTitle("Lunch Tyme")
        setNavigationButton()
        fetchRestaurantsData()
    }
    
    func fetchRestaurantsData() {
        NetworkManager.sharedManager.fetchData(path: Constants.kRestaurantsApi) { (result) in
            if case .success(let res) = result {
                DispatchQueue.global(qos: .userInitiated).async {
                    self.restaurantList = res.restaurants
                    DispatchQueue.main.async {
                        self.collectnView.reloadData()
                    }
                }
            } else {
                DispatchQueue.global(qos: .userInitiated).async {
                    self.restaurantList.removeAll()
                    DispatchQueue.main.async {
                        self.collectnView.reloadData()
                    }
                }
            }
        }
    }

}

class LunchViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryType: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var backGroundImg: UIImageView!
    @IBOutlet weak var customView: UIView!
}
