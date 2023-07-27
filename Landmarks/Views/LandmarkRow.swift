//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI

struct LandmarkRow: View {
    
    // Add landmark as a stored property of LandmarkRow.
    // When you add the landmark property, the preview stops working, because the LandmarkRow type needs a landmark instance during initialization.
    var landmark: Landmark
    
    var body: some View {
        // Embed the existing text view in an HStack.
        HStack {
            // Modify the text view to use the landmark property’s name.
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        
        // To fix the preview, you’ll need to modify the preview provider.
        // In the previews static property of LandmarkRow_Previews, add the landmark parameter to the LandmarkRow initializer, specifying the first element of the landmarks array.
        // The preview displays the text, “Hello, World!”.
        LandmarkRow(landmark: landmarks[0])
    }
}
