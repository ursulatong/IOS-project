//
//  Card.swift
//  ParallaxCarousel
//
//  Created by Ka Yin Tong on 24/5/2024.
//


import Foundation
import SwiftUI
import CoreLocation

struct CarouselCard: Hashable, Codable, Identifiable {
    
    var id: Int
    var title: String
    var subTitle: String
    var imageName: String
    
}

