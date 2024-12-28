//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Aditya Singh on 27/11/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    // Creates a model instance and supply it to ContentView using the env(_:) modifier
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
