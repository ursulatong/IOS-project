//
//  CarouselView.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 25/5/2024.
//

import SwiftUI

struct CarouselView: View {
    var image: Image

    var body: some View {
        image
            .frame(width: 350, height: 350)
            .clipShape(Rectangle())
            .overlay {
                Rectangle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CarouselView(image: Image("mountFuji"))
}
