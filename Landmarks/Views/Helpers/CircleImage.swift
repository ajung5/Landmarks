//
//  CircleImage.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI

struct CircleImage: View {
    
    // In CircleImage.swift, add a stored image property to CircleImage.
    // This is a common pattern when building views using SwiftUI. Your custom views will often wrap and encapsulate a series of modifiers for a particular view.
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        // Update the preview provider to pass the image of Turtle Rock.
        CircleImage(image: Image("turtlerock"))
    }
}
