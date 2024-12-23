//
//  FeatureCard.swift
//  Landmark
//
//  Created by Aditya Singh on 16/12/24.
//

/// FeatureCard.swift that displays the landmark’s feature image.
///

import SwiftUI

struct FeatureCard: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

/// Overlay text information about the landmark on the image.
struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
                    gradient
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .font(.title)
                            .bold()
                        Text(landmark.park)
                    }
                    .padding()
                }
                .foregroundStyle(.white)
    }
    
}

#Preview {
    /// Include the aspect ratio modifier so it mimics the aspect ratio of the view where FeatureCard will eventually preview later.
    if let firstFeature = ModelData().features.first {
            FeatureCard(landmark: firstFeature)
                .aspectRatio(3/2, contentMode: .fit)
        } else {
            Text("No features available")
        }
}
