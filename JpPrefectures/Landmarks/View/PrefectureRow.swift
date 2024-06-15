//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import SwiftUI

struct PrefectureRow: View {
    var prefecture: Prefecture
    
    var body: some View {
        HStack {
            prefecture.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(prefecture.city)
            
            Spacer()
            
            if prefecture.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    let prefectures = ModelData().prefectures

    return Group {
        PrefectureRow(prefecture: prefectures[0])
        PrefectureRow(prefecture: prefectures[1])
    }
}
