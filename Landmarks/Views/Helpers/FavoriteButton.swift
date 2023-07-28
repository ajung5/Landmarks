//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Agung Nawawi on 28/07/23.
//

import SwiftUI

struct FavoriteButton: View {
    // Add an isSet binding that indicates the button’s current state, and provide a constant value for the preview.
    // Because you use a binding, changes made inside this view propagate back to the data source.
    @Binding var isSet: Bool
    
    var body: some View {
        // Create a Button with an action that toggles the isSet state, and that changes its appearance based on the state.
        // The title string that you provide for the button’s label doesn’t appear in the UI when you use the iconOnly label style, but VoiceOver uses it to improve accessibility.
        Button {
            isSet.toggle()
        } label:  {
            Label ("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ?  .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
