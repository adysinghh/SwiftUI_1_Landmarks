//
//  PageView.swift
//  Landmark
//
//  Created by Aditya Singh on 16/12/24.
//

import SwiftUI


struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var selectedPage = 0


    var body: some View {
///aspect ratio modifier and update the preview to pass the required array of views, and the preview starts working.
        /// Replace the text box with the page control, switching from a VStack to ZStack for layout. Because we're
        /// passing the page count and the binding to the current page, the page control is already showing the correct vals.
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, selectedPage: $selectedPage)
            ///$ syntax to create a binding to a value that is stored as state
            PageControl(numberOfPages: pages.count, selectedPage: $selectedPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}


///
#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
