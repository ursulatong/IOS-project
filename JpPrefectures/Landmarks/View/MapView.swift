//
//  MapView.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 23/5/2024.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    @Binding var zoomValue: CLLocationDegrees
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.isZoomEnabled = false
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
            let region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: zoomValue, longitudeDelta: zoomValue)
            )
            mapView.setRegion(region, animated: true)
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapViewWithZoomButtons: View {
    var coordinate: CLLocationCoordinate2D
    @Binding var zoomValue: CLLocationDegrees
    
    @State private var initialZoomValue: CLLocationDegrees = 0.2
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapView(coordinate: coordinate, zoomValue: $zoomValue)
                .navigationBarTitleDisplayMode(.inline)
            
            VStack {
                Button(action: {
                    zoomValue *= 0.5
                }) {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    zoomValue *= 2
                }) {
                    Image(systemName: "minus.square.fill")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 24.0)
            .padding(.trailing, 12.0)
        }
        
        // When the view appears, the onAppear modifier is used to set the zoomValue to the initialZoomValue.
        .onAppear {
            zoomValue = initialZoomValue
        }
    }
}



#Preview {
    MapViewWithZoomButtons(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), zoomValue: .constant(0.01))
}
    
