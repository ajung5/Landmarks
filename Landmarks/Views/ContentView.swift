//
//  ContentView.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI


struct ContentView: View {
    // Add a state variable for the tab selection, and give it a default value.
    @State private var selection: Tab = .featured
    
    // test
    // add an enumeration of the tabs to display.
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // Create a tab view that wraps the LandmarkList, as well as the new CategoryHome.
        // The tag(_:) modifier on each of the views matches one of the possible values that the selection property can take so the TabView can coordinate which view to display when the user makes a selection in the user interface.
        TabView(selection: $selection) {
            CategoryHome()
                // Give each tab a label.
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                // Give each tab a label
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
        
        // Change ContentView to instead display LandmarkList.
        //LandmarkList()
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
