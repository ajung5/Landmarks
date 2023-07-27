//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
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
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
