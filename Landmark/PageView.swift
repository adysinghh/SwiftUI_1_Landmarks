//
//  PageView.swift
//  Landmark
//
//  Created by Aditya Singh on 16/12/24.
//

import SwiftUI


struct PageView<Page: View>: View {
    var pages: [Page]


    var body: some View {
///aspect ratio modifier and update the preview to pass the required array of views, and the preview starts working.
        PageViewController(pages: pages)
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}


///
#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
