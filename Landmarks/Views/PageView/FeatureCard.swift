//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//


// Add a new SwiftUI view file, named FeatureCard.swift that displays the landmark’s feature image.
import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            // Overlay text information about the landmark on the image.
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}


// Overlay text information about the landmark on the image.
struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
