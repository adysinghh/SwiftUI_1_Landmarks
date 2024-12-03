//
//  ProfileHost.swift
//  Landmark
//
//  Created by Aditya Singh on 03/12/24.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode // To access the editMode value that’s built into the environment to read or write the edit scope.
    @Environment(ModelData.self) var modelData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                            ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                //populate the editor with the correct profile data and update the persistent profile when the user taps the Done button.
                    .onAppear{
                        draftProfile = modelData.profile
                    }//old values appear the next time edit mode activates.
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
