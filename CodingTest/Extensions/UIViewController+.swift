//
//  UIViewController+.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/14/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Customize Back Button
    func setBackButton(){
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage(named: "ic_webBack"), for: .normal)
        leftButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        leftButton.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    // MARK: - Set Up Navigation Bar Title
    func setTitle(_ titleText: String) {
        self.title = titleText
    }
    
    // MARK: Set Navigation Bar right button
    func setNavigationButton() {
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(UIImage(named: "icon_map"), for: .normal)
        rightButton.addTarget(self, action: #selector(mapButtonPressed), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 53, height: 51)

        let barButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    // MARK: - Add Actions
    @objc func mapButtonPressed() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
