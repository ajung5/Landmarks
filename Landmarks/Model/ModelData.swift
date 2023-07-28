//
//  ModelData.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import Foundation
import Combine

// Declare a new model type that conforms to the ObservableObject protocol from the Combine framework.
// SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.
final class ModelData: ObservableObject{
    // Move the landmarks array into the model.
    // Add the @Published attribute to the landmarks array.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

// Create an array of landmarks that you initialize from landmarkData.json.
var landmarks: [Landmark] = load("landmarkData.json")

// Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.
// The load method relies on the return type’s conformance to the Decodable protocol, which is one component of the Codable protocol.
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
