//
//  LoginButtonView.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI

struct LoginButtonView: View {
    
    let icon: String
        
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .frame(width: 40, height: 40)
        }
        .frame(width: 40)
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
        LoginButtonView(icon: "AppleLogo")
    }
}
