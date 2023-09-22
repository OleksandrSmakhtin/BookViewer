//
//  LoginButtonView.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI

struct LoginButtonView: View {
    
    let text: String
    let icon: String
    
    let isIcon: Bool
    
    var body: some View {
        HStack {
            if isIcon {
                Image(systemName: icon.isEmpty ? "" : icon)
                    .resizable()
                    .frame(width: 30, height: 20)
                    .foregroundColor(.primary)
                Text(text)
                    .foregroundColor(Color.primary)
            } else {
                Image(icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(text)
                    .foregroundColor(Color.primary)
            }
        }
        .frame(width: 300)
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(.gray, lineWidth: 4)
                .opacity(0.2)
        )
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(text: "Countiue with Google", icon: "GoogleLogo", isIcon: false)
    }
}
