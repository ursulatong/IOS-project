//
//  ModelData.swift
//  Landmarks
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import Foundation

@Observable
class ModelData {
    var prefectures: [Prefecture] = load("prefectureData.json")
}

var carouselCards: [CarouselCard] = load("carouselCard.json")


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

