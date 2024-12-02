//
//  FavouriteButton.swift
//  Landmarks
//
//  Created by Aditya Singh on 28/11/24.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isFavourite: Bool
    
    
    
    var body: some View {
        Button{
            isFavourite.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isFavourite ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(isFavourite ? .red : .gray)
        }
    }
}

#Preview {
    FavouriteButton(isFavourite: .constant(true))
}
