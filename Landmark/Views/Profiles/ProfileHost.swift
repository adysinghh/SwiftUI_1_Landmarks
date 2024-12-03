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
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                            ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
