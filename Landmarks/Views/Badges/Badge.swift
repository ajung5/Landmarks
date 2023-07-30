//
//  Badge.swift
//  Landmarks
//
//  Created by Agung Nawawi on 30/07/23.
//

import SwiftUI

struct Badge: View {
    // Lay the badge’s symbol over the badge background by placing it in a ZStack.
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
                   RotatedBadgeSymbol(
                       angle: .degrees(Double(index) / Double(8)) * 360.0
                   )
               }
            .opacity(0.5)
    }
    
    var body: some View {
        // Place BadgeBackground in the body of Badge.
        ZStack {
            BadgeBackground()
            
            // Correct the size of the badge symbol by reading the surrounding geometry and scaling the symbol.
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
