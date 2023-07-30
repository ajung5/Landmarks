//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Agung Nawawi on 30/07/23.
//

import SwiftUI

// Create a new RotatedBadgeSymbol view to encapsulate the concept of a rotated symbol.
// Experiment
// Adjust the angle in the preview to test the effect of the rotation.
struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
