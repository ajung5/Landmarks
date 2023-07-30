//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Agung Nawawi on 30/07/23.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        // Wrap the path in a GeometryReader so the badge can use the size of its containing view, which defines the size instead of hard-coding the value (100).
        // Using the smallest of the geometry’s two dimensions preserves the aspect ratio of the badge when its containing view isn’t square.
        GeometryReader { geometry in
            
            // add a Path shape to the badge and apply the fill() modifier to turn the shape into a view.
            // You use paths to combine lines, curves, and other drawing primitives to form more complex shapes like the badge’s hexagonal background.
            Path { path in
                // Add a starting point to the path, assuming a container with size 100 x 100 px.
                // The move(to:) method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                //Scale the shape on the x-axis using xScale, and then add xOffset to recenter the shape within its geometry.
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y:height * (0.20 + HexagonParameters.adjusment)
                    )
                )
                // Draw the lines for each point of the shape data to create a rough hexagonal shape.
                // The addLine(to:) method takes a single point and draws it. Successive calls to addLine(to:) begin a line at the previous point and continue to the new point.
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint (
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    // Use the addQuadCurve(to:control:) method to draw the Bézier curves for the badge’s corners.
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            
            // Replace the solid black background with a gradient to match the design.
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        
        // Apply the aspectRatio(_:contentMode:) modifier to the gradient fill.
        .aspectRatio(1, contentMode:.fit)
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
