//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Agung Nawawi on 30/07/23.
//

import SwiftUI

struct BadgeSymbol: View {
    // Fill the symbol with the purple color from the design.
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        // Draw the top portion of the symbol using the path APIs.
        // Experiment
        //Adjust the numeric multipliers associated with the spacing, topWidth, and topHeight constants to see how they influence the overall shape.
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                // Draw the bottom portion of the symbol.
                // Use the move(to:) modifier to insert a gap between multiple shapes in the same path.
                path.move(to:  CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            // Fill the symbol with the purple color from the design.
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
