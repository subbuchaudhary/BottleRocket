//
//  DetailsViewController.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/13/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantCategory: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var socialNetwork: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    var restaurant: Restaurants?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        setNavigationButton()
        setTitle("Lunch Tyme")
        dataBinding()
    }
    
    func dataBinding() {
        
        guard  restaurant != nil else {
            return
        }
        // Restaurant Name
        restaurantName.text = restaurant?.name
        restaurantCategory.text = restaurant?.category
        
        // Address
        let arr = restaurant?.location.formattedAddress
        restaurantAddress.text = arr?.joined(separator: ", ")
        
        // Restaurant Contact Details
        if restaurant?.contact != nil {
        guard let twitterHandle = restaurant?.contact?.twitter else {
            socialNetwork.isHidden = true
            return
        }
        socialNetwork.text = "@" + twitterHandle
        phoneNumber.text = restaurant?.contact?.formattedPhone
        } else {
            socialNetwork.isHidden = true
            phoneNumber.isHidden = true
        }
        
        // Add restaurant Navigation
        addMarker()
    }
    
    func addMarker() {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: restaurant?.location.lat ?? 0.0, longitude:restaurant?.location.lng ?? 0.0)
        annotation.coordinate = centerCoordinate
        annotation.title = restaurant?.name ?? ""
        self.mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        mapView.region = region
    }

}
