//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Aditya Singh on 27/11/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    //calculate the index of the input landmark by comparing it with the model data
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -100)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                //&-> to bind to the isFavorite property with the dollar sign($)
                FavouriteButton(isFavourite: $modelData.landmarks[landmarkIndex].isFavorite)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            
            .padding()
            
        }
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
