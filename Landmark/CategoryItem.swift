//
//  CategoryItem.swift
//  Landmark
//
//  Created by Aditya Singh on 03/12/24.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155,height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.headline)
        }
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
