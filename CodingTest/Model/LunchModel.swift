//
//  LunchModel.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/13/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

struct LunchModel: Codable {
    let restaurants: [Restaurants]
}

struct Restaurants: Codable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contact?
    let location: Location
}

struct Contact: Codable {
    let phone: String
    let formattedPhone: String
    let twitter: String?
}

struct Location: Codable {
    let address: String
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let postalCode: String?
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}
