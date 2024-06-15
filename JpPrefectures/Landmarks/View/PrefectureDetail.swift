//
//  ContentView.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import SwiftUI

struct PrefectureDetail: View {
    @Environment(ModelData.self) var modelData
    
    var prefecture: Prefecture
    @State private var zoomValue = 0.01
    
    var landmarkIndex: Int {
        modelData.prefectures.firstIndex(where: { $0.id == prefecture.id })!
    }
    
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .center) {
                    NavigationLink(destination: MapViewWithZoomButtons(coordinate: prefecture.locationCoordinate, zoomValue: $zoomValue)) {
                        SimpleMap(coordinate: prefecture.locationCoordinate)
                            .frame(height: 300)
                    }.navigationBarTitleDisplayMode(.inline)
                    
                    
                    CircleImage(image: prefecture.image)
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(prefecture.city)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.prefectures[landmarkIndex].isFavorite)
                        }
                        
                        Divider()
                        
                        Text("About \(prefecture.city)")
                            .font(.title2)
                        Text(prefecture.description)
                        Spacer()
                        Link("Learn More", destination: URL(string: prefecture.url)!)
                        
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    let modelData = ModelData()
    return PrefectureDetail(prefecture: modelData.prefectures[0])
        .environment(modelData)
}
