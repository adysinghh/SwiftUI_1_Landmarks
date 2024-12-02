//
//  ContentView.swift
//  Landmarks
//
//  Created by Aditya Singh on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
