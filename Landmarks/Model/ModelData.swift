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
    
    // Load the hikes array into your model object.
    // Because you’ll never modify hike data after initially loading it, you don’t need to mark it with the @Published attribute.
    var hikes: [Hike] = load("hikeData.json")
    
    // Update the ModelData class to include an instance of the user profile that persists even after the user dismisses the profile view.
    @Published var profile = Profile.default
    
    // add a new computed features array, which contains only the landmarks that have isFeatured set to true.
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured}
    }
    
    // add a computed categories dictionary, with category names as keys, and an array of associated landmarks for each key.
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue}
        )
    }
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
