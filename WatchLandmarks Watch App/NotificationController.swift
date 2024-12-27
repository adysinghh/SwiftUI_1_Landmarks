//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by Aditya Singh on 27/12/24.
//

import SwiftUI
import WatchKit
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    /// Define the landmarkIndex key. <We Use this Key to Extract the landmark index from the notification>
    
    let landmarkIndexKey: String = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    
    /**
     This method updates the controllers properties, After calling this method, the system invalidates the controller's body property,
     which updates your notification view. The system then displays the notification on Watch
     
     */
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationData = notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}

