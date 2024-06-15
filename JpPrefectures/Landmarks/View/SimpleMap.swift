//
//  MapView.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 23/5/2024.
//

import SwiftUI
import MapKit

struct SimpleMap: View {
    var coordinate: CLLocationCoordinate2D

    
    var body: some View {
       // Map(position: .constant(.region(region)))
        Map(initialPosition: .region(region))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    SimpleMap(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
