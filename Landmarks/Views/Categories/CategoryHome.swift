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
    
    @State private var showingProfile = false
    
    
    var body: some View {
        // Add a NavigationView to host the different categories.
        // You use navigation views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.
        NavigationView {
            // Display the categories in Landmarks using a List.
            // The Landmark.Category case name identifies each item in the list, which must be unique among other categories because it’s an enumeration.
            List {
                // add the image of the first featured landmark to the top of the list.
                // You’ll turn this view into an interactive carousel in a later tutorial. For now, it displays one of the featured landmarks with a scaled and cropped preview image.
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
                
                    // replace the placeholder feature image with the new page view.
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0)})
                    .aspectRatio(3/2, contentMode: .fit)
                
                    // Set the edge insets to zero on both kinds of landmark previews so the content can extend to the edges of the display.
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(modelData.categories.keys.sorted(), id: \..self) { key in
                    // Text(key)
                    
                    // Update the body of CategoryHome to pass category information to instances of the row type.
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            
                // Add the listStyle modifier to pick a list style that better suits the content.
                .listStyle(.inset)
            
                // Set the title of the navigation bar to Featured.
                // The view showcases one or more featured landmarks at the top.
                .navigationTitle("Featured")
            
                // add a user profile button to the navigation bar using the toolbar modifier, and present the ProfileHost view when the user taps it.
                .toolbar {
                    Button  {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
            
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
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
