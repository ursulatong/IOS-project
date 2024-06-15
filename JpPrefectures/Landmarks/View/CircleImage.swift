//
//  CircleImage.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import SwiftUI

struct CircleImage: View {
    var image: Image


    var body: some View {
        image
            .resizable()
            .frame(width: 350, height: 350)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("tokyo"))
}

