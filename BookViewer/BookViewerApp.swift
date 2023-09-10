//
//  BookViewerApp.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI
import Firebase
import UIKit
import GoogleSignIn
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // asks user to allow the notifications of types     \/
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { allow, error in
            // check user's permission
            guard allow else { return }
            // check what exactly user accept
            self.notificationCenter.getNotificationSettings { settings in
                print(settings)
                // if all of settings allowed, the guard statement let us go bellow
                guard settings.authorizationStatus == .authorized else { return }
            }
            
        }
        notificationCenter.delegate = self
         
        return true
    }
    
}

//MARK: UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.sound, .banner])
        print(#function)
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(#function)
    }
    
}

@main
struct BookViewerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


