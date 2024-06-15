//
//  ContentView.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ParallaxCarouselView()
    }
}


#Preview {
    ContentView().environment(ModelData())
}
