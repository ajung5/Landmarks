//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

import SwiftUI

struct CategoryItem: View {
    // Create a new custom view called CategoryItem that displays one landmark.
    var landmark: Landmark
    
    
    var body: some View {
        VStackLayout(alignment: .leading) {
            landmark.image
                // Change the navigation appearance of the category items by applying the renderingMode(_:) and foregroundColor(_:) modifiers.
                // Text that you pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images. You can modify either behavior to best suit your design.
                .renderingMode(.original)
            
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
