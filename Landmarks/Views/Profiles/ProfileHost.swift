//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

import SwiftUI

struct ProfileHost: View {
    // Add an Environment view property that keys off of the environment’s \.editMode.
    // SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper. Access the editMode value to read or write the edit scope.
    @Environment(\.editMode) var editMode
    
    // Read the user’s profile data from the environment to pass control of the data to the profile host.
    // To avoid updating the global app state before confirming any edits — such as while the user enters their name — the editing view operates on a copy of itself.
    @EnvironmentObject var modelData: ModelData
    
    @State private var draftProfile = Profile.default
    
    var body: some View {
        // add a view named ProfileHost to that group with a text view that displays the username of a stored profile.
        // The ProfileHost view will host both a static, summary view of profile information and an edit mode.
        
        // Update ProfileHost to display the new summary view.
        VStack (alignment: .leading, spacing: 20) {
            // Create an Edit button that toggles the environment’s editMode value on and off.
            //The EditButton controls the same editMode environment value that you accessed in the previous step.
            HStack {
                Spacer()
                EditButton()
            }
            
            // Add a conditional view that displays either the static profile or the view for Edit mode.
            // You can see the effect of entering edit mode by running the live preview and tapping the edit button. For now, the Edit mode view is just a static text field.
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                // Update the conditional content in ProfileHost to include the profile editor and pass along the profile binding.
                // Now the edit profile view displays when you tap Edit.
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            // add the model data as an environment object to the preview.
            // Even though this view doesn’t use a property with the @EnvironmentObject attribute, ProfileSummary, a child of this view, does. So without the modifier, the preview fails.
            .environmentObject(ModelData())
    }
}
