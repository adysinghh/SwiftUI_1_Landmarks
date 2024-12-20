//
//  CategoryHome.swift
//  Landmark
//
//  Created by Aditya Singh on 03/12/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                            modelData.features[0].image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .listRowInsets(EdgeInsets())//Sets the edge insets to zero on both kinds of landmark previews so the content can extend to the edges of the display.
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .listStyle(.inset)
                .navigationTitle("Landmarks")
                .toolbar{
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
        } detail: {
            Text ("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
