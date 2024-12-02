//
//  Badge.swift
//  Landmarks
//
//  Created by Aditya Singh on 02/12/24.
//

import SwiftUI

struct Badge: View {
    var badgeSymobol: some View {
        
        /**_
         360° rotation split into eight segments creates a sun-like pattern by repeating the mountain symbol.
         */
        
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8.0)) * 360.0
            )
            
        }.opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
        
            
            /**_
             size of the badge symbol by reading the surrounding geometry and scaling the symbol.
             **/
            
            /****
             GeometryReader dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iPhone.
             */
            GeometryReader { geometry in
                badgeSymobol
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }

}

#Preview {
    Badge()
}
