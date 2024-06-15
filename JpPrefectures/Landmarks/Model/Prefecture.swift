//
//  Landmarks.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import Foundation
import SwiftUI
import CoreLocation



struct Prefecture: Hashable, Codable, Identifiable {
    
    var id: Int
    var city: String
    var description: String
    var url: String
    var isFavorite: Bool

    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }



    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

}

