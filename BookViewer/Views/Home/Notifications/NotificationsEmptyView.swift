//
//  NotificationsEmptyView.swift
//  BookViewer
//
//  Created by Роман on 05.08.2023.
//

import SwiftUI

struct NotificationsEmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "shippingbox.fill")
                .font(.system(size: 100))
                .foregroundColor(.orange)
            Text("Empty")
                .font(.title2)
                .bold()
                .padding(5)
            Text("You don't have any notifications")
                .foregroundColor(Color.secondary)
        }
    }
}

struct NotificationsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsEmptyView()
    }
}
