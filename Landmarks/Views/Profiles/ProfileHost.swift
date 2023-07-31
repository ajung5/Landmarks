//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    
    var body: some View {
        // add a view named ProfileHost to that group with a text view that displays the username of a stored profile.
        // The ProfileHost view will host both a static, summary view of profile information and an edit mode.
        
        // Update ProfileHost to display the new summary view.
        VStack (alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
