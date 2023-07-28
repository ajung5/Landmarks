//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI

struct LandmarkList: View {
    // In LandmarkList.swift, add an @EnvironmentObject property declaration to the view, and an environmentObject(_:) modifier to the preview.
    // The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
    @EnvironmentObject var modelData: ModelData
    
    // Add a @State property called showFavoritesOnly with its initial value set to false.
    // Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as private.
    @State private var showFavoritesOnly = false
    // Change the initial value of showFavoritesOnly to true to see how the list reacts.
    // Before moving on, return the default value of showsFavoritesOnly to false.
    
    // Compute a filtered version of the landmarks list by checking the showFavoritesOnly property and each landmark.isFavorite value.
    var filteredLandmarks: [Landmark] {
        // Use modelData.landmarks as the data when filtering landmarks.
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        //Embed the dynamically generated list of landmarks in a NavigationView.
        NavigationView {
            // Replace the default Text view with a List, and provide LandmarkRow instances with the first two landmarks as the list’s children.
            // The preview shows the two landmarks rendered in a list style that’s appropriate for iOS.
            //        List {
            //            LandmarkRow(landmark: landmarks[0])
            //            LandmarkRow(landmark: landmarks[1])
            //        }
            
            // # make list dynamic
            // Remove the two static landmark rows, and instead pass the model data’s landmarks array to the List initializer.
            // Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
            
            // remove the id parameter.
            // Use the filtered version of the list of landmarks in the List.
            
//            List(filteredLandmarks) { landmark in
//                // Complete the dynamically-generated list by returning a LandmarkRow from the closure.
//                // This creates one LandmarkRow for each element in the landmarks array.
//
//                // Inside the list’s closure, wrap the returned row in a NavigationLink, specifying the LandmarkDetail view as the destination.
//                NavigationLink {
//                    LandmarkDetail(landmark: landmark)
//                } label: {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
            
            // Create a nested ForEach group to transform the landmarks into rows.
            // To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List.
            List {
                // Add a Toggle view as the first child of the List view, passing a binding to showFavoritesOnly.
                // You use the $ prefix to access a binding to a state variable, or one of its properties.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            
            // Call the navigationTitle(_:) modifier method to set the title of the navigation bar when displaying the list.
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // Within the list preview, embed the LandmarkList in a ForEach instance, using an array of device names as the data.
        // ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
        
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                // Use the previewDisplayName(_:) modifier to add the device names as labels for the previews.
//                .previewDisplayName(deviceName)
//        }
        
        // Select LandmarkList.swift in the Project navigator and revert the preview to show only a single version of the list.
        LandmarkList()
            .environmentObject(ModelData())
    }
}
