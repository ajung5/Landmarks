//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

import SwiftUI

struct CategoryRow: View {
    // Add properties for the category name and the list of items in that category.
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        
        // Put the category’s items in an HStack, and group that with the category name in a VStack.
        // Display the name of the category.
        VStack (alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // Give the content some space by specifying a tall frame(width:height:), adding padding, and wrapping the HStack in a scroll view.
            // Updating the view preview with a larger sampling of data makes it easier to ensure that the scrolling behavior is correct.
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        // Text(landmark.name)
                        // replace the Text that holds the landmark name with the new CategoryItem view.
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    // Add properties for the category name and the list of items in that category.
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
