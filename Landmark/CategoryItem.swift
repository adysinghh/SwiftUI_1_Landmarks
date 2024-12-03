//
//  CategoryItem.swift
//  Landmark
//
//  Created by Aditya Singh on 03/12/24.
//


/***
 .renderingMode -> Text that you pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images
 */
import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155,height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.headline)
        }
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
