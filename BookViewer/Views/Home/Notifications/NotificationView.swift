//
//  NotificationView.swift
//  BookViewer
//
//  Created by Роман on 05.08.2023.
//

import SwiftUI

struct NotificationView: View {
    
    let title: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 60))
                .padding(5)
                .background(Color.orange)
                .cornerRadius(50)
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .font(.title2)
                Text(text)
                    .foregroundColor(Color.secondary)
                    .padding(-1)
            }
            .padding()
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(title: "Security updates", text: "We've added sign in with Apple")
    }
}
