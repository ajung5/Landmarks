//
//  ContentView.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        // Change ContentView to instead display LandmarkList.
        LandmarkList()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // Update the ContentView preview to add the model object to the environment, which makes the object available to any subview.
        // A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environmentObject(_:) modifier.
            .environmentObject(ModelData())
    }
}
