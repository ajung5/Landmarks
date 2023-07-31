//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

// Create another view in the Profiles group named ProfileSummary that takes a Profile instance and displays some basic user information.
// The profile summary takes a Profile value rather than a binding to the profile because the parent view, ProfileHost, manages the state for this view.

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                
                // Update ProfileSummary to add several badges with varying hues and reasons for earning the badge.
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                // Finish off the profile summary by including a HikeView from Animating Views and Transitions.
                // To use the hike data, you also need to add a model data environment object.
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
