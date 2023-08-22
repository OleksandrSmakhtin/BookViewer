//
//  CardNotifications.swift
//  BookViewer
//
//  Created by Роман on 21.08.2023.
//

import Foundation
import UserNotifications

class CardNotifications {
    
    static let shared = CardNotifications()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func didPurchaseBook(bookTitle: String) {
        // content
        let content = UNMutableNotificationContent()
        content.title = "Book Viewer"
        content.body = "You have successfully bought \(bookTitle)"
        content.sound = .default
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        // request notification
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        // sending
        notificationCenter.add(request) { error in
            guard let error = error else { return }
            print(error.localizedDescription)
        }
    }
    
}
