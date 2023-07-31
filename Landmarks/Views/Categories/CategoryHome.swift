//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        // Add a NavigationView to host the different categories.
        // You use navigation views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                // Set the title of the navigation bar to Featured.
                // The view showcases one or more featured landmarks at the top.
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
