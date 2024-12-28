//
//  ContentView.swift
//  MacLandmark
//
//  Created by Aditya Singh on 28/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700,minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
