//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import SwiftUI

struct PrefectureList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredPrefectures: [Prefecture] {
        modelData.prefectures.filter { prefecture in
               (!showFavoritesOnly || prefecture.isFavorite)
           }
       }
    
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }


                ForEach(filteredPrefectures) { prefecture in
                    NavigationLink {
                        PrefectureDetail(prefecture: prefecture)
                    } label: {
                        PrefectureRow(prefecture: prefecture)
                    }
                }
            }
            .animation(.default, value: filteredPrefectures)
            .navigationTitle("Top 10 Prefectures")
            
        }
    }
}


#Preview {
    PrefectureList()
        .environment(ModelData())
}
