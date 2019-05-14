//
//  UIImageView+.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/13/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit
    let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                imageCache.setObject(image, forKey: NSString(string: url.lastPathComponent))
                self.image = image
            }
            }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        
        if let cacheImg = imageCache.object(forKey: NSString(string: url.lastPathComponent)) {
            self.image = cacheImg
        } else {
            downloaded(from: url, contentMode: mode)
        }
    }
}
