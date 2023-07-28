//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI

struct LandmarkDetail: View {
    // In LandmarkDetail.swift, add a Landmark property to the LandmarkDetail type.
    var landmark: Landmark
    
    var body: some View {
        // Embed the VStack that holds the three text views in another VStack.
        ScrollView {
            
            // Add your custom MapView to the top of the stack. Set the size of the MapView with frame(width:height:).
            // When you specify only the height parameter, the view automatically sizes to the width of its content. In this case, MapView expands to fill the available space.
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                // To allow the map content to extend to the top edge of the screen, add the ignoresSafeArea(edges: .top) modifier to the map view.
                .ignoresSafeArea(edges: .top)
            
            // Add the CircleImage view to the stack.
            CircleImage(image: landmark.image)
                // To layer the image view on top of the map view, give the image an offset of -130 points vertically, and padding of -130 points from the bottom of the view.
                // These adjustments make room for the text by moving the image upwards.
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)


                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                
                // Finally, move the subheadline font modifier from each Text view to the HStack containing them, and apply the secondary color to the subheadline text.
                // When you apply a modifier to a layout view like a stack, SwiftUI applies the modifier to all the elements contained in the group.
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                // Add a divider and some additional descriptive text for the landmark.
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            
            // Add a spacer at the bottom of the outer VStack to push the content to the top of the screen.
            //Spacer()
            
                .navigationTitle(landmark.name)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
