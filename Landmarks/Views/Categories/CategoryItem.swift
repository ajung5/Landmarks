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
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
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
