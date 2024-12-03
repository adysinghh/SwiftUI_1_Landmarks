//
//  ContentView.swift
//  Landmarks
//
//  Created by Aditya Singh on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    
    //state variable for the tab selection i.e., featured will be selected as default
    @State private var selection: Tab = .featured
    
    /***
     enumeration of the tabs to display.
     */
    enum Tab {
            case featured
            case list
        }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
//        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
