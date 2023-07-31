//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

import SwiftUI

struct CategoryHome: View {
    
    // create a modelData environment object.
    // You’ll need access to the categories right now, as well as to other landmark data later.
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        // Add a NavigationView to host the different categories.
        // You use navigation views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.
        NavigationView {
            // Display the categories in Landmarks using a List.
            // The Landmark.Category case name identifies each item in the list, which must be unique among other categories because it’s an enumeration.
            List {
                ForEach(modelData.categories.keys.sorted(), id: \..self) { key in
                    Text(key)
                }
            }
            
            
                // Set the title of the navigation bar to Featured.
                // The view showcases one or more featured landmarks at the top.
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            // create a modelData environment object.
            // You’ll need access to the categories right now, as well as to other landmark data later.
            .environmentObject(ModelData())
    }
}
