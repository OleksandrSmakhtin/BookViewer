//
//  NotificationsView.swift
//  BookViewer
//
//  Created by Роман on 05.08.2023.
//

import SwiftUI

struct NotificationsView: View {
    
    let notifications: [Notification] = [
        Notification(title: "Visual updates", text: "We've added a new page with filtering books"),
    ]
    
    var body: some View {
        VStack {
            if notifications.count != 0 {
                ScrollView {
                    ForEach(notifications) { notification in
                        NotificationView(title: notification.title, text: notification.text)
                            .padding()
                    }
                }
            } else {
                NotificationsEmptyView()
            }
        }
        .padding()
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
