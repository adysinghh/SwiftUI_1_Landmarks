//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Aditya Singh on 27/12/24.
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
