//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Aditya Singh on 02/12/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        /**
         GeometryReader so the badge can use the size of its containing view, which defines the size instead of hard-coding the value
         Similar to Match parents in Android.
         */
        GeometryReader {geometry in
            Path { path in
                
                /**
                 starting point to the path, assuming a container with size 100 x 100 px.
                 */
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                /**
                 Scale the shape on the x-axis using xScale, and then add xOffset to recenter the shape within its geometry.
                 */
                let xScale: CGFloat = 0.832
                let xOffset: CGFloat = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                /**_
                 move(to:) method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing.
                 */
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
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
            
            // For gradient placemnt and postion inside
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit) // center of the screen
    }
        static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
        static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    }


#Preview {
    BadgeBackground()
}
