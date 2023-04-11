//
//  Notification .swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 11/04/2023.
//

import Foundation
import UserNotifications

class NotificationManager {
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert,.badge,.sound]) { success, error in
            if success {
                print("access granted!")
            } else if let error = error {
                print(error.localizedDescription)
                print("clicked")
                
            }
        }
    }
    
    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String) {
        var trigger: UNNotificationTrigger?
        
        if type == "date" {
            let dateComponents = Calendar.current.dateComponents([.minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        } else if type == "time" {
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
