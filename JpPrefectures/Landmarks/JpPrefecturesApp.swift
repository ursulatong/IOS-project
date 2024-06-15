//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import SwiftUI

@main
struct JpPrefecturesApp: App {
    
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
