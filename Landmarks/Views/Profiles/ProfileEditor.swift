//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

// Create a new view named ProfileEditor and include a binding to the draft copy of the user’s profile.
// The first control in the view is a TextField, which controls and updates a string binding — in this case, the user’s chosen display name. You provide a label and a binding to a string when creating a text field.

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    //add a DatePicker below the season selector to make the landmark visitation goal date modifiable.
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField ("Username", text: $profile.username)
            }
            
            // Add a toggle that corresponds with the user’s preference for receiving notifications about landmark-related events.
            //Toggles are controls that are either on or off, so they’re a good fit for Boolean values like a yes or no preference.
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            // Place a Picker control and its label in a VStack to make the landmark photos have a selectable preferred season.
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) {season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            //add a DatePicker below the season selector to make the landmark visitation goal date modifiable.
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
