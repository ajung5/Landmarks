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
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
