//
//  NavLinkView.swift
//  BookViewer
//
//  Created by Роман on 05.08.2023.
//

import SwiftUI

struct NavLinkView: View {
    
    let icon: String
    let text: String
    let iconSize: Int
    
    var body: some View {
        HStack {
            Text(text)
                .bold()
                .font(.title3)
                .foregroundColor(Color.primary)
            Spacer()
            Image(systemName: icon)
                .foregroundColor(.orange)
                .font(.system(size: CGFloat(iconSize)))
        }
        .padding()
    }
}

struct NavLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavLinkView(icon: "arrow.forward", text: "Explore all", iconSize: 20)
    }
}
