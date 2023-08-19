//
//  HeaderView.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Image("BookLogo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: NotificationsView(), label: {
                        Image(systemName: "bell")
                            .font(.system(size: 25))
                            .foregroundColor(.orange)
                    })
                }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
