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
            
            // After the spacer, add a star image inside an if statement to test whether the current landmark is a favorite.
            // In SwiftUI blocks, you use if statements to conditionally include views.
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    // Because system images are vector based, you can change their color with the foregroundColor(_:) modifier.
                    // The star is present whenever a landmark’s isFavorite property is true. You’ll see how to modify that property later in this tutorial.
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            // To fix the preview, you’ll need to modify the preview provider.
            // In the previews static property of LandmarkRow_Previews, add the landmark parameter to the LandmarkRow initializer, specifying the first element of the landmarks array.
            // The preview displays the text, “Hello, World!”.
            LandmarkRow(landmark: landmarks[0])
            // Use the previewLayout(_:) modifier to set a size that approximates a row in a list.
               // .previewLayout(.fixed(width: 300, height: 70))
            
            LandmarkRow(landmark: landmarks[1])
            // Use the previewLayout(_:) modifier to set a size that approximates a row in a list.
                //.previewLayout(.fixed(width: 300, height: 70))
        }
        
        //To simplify the code, move the previewLayout(_:) call to the outside of the group’s child declarations.
        // A view’s children inherit the view’s contextual settings, such as preview configurations.
        // Use the previewLayout(_:) modifier to set a size that approximates a row in a list.
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
