//
//  TabButtonView.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct TabButtonView: View {
    
    let icon: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(text)
        }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabButtonView(icon: "house", text: "Home")
    }
}
