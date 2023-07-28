//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI

struct LandmarkList: View {
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
            List(landmarks) { landmark in
                // Complete the dynamically-generated list by returning a LandmarkRow from the closure.
                // This creates one LandmarkRow for each element in the landmarks array.
                
                // Inside the list’s closure, wrap the returned row in a NavigationLink, specifying the LandmarkDetail view as the destination.
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
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
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                // Use the previewDisplayName(_:) modifier to add the device names as labels for the previews.
                .previewDisplayName(deviceName)
        }
    }
}
