//
//  AccountAboutScreen.swift
//  BookViewer
//
//  Created by Роман on 11.08.2023.
//

import SwiftUI

struct AccountAboutScreen: View {
    
    let properties = [
        Property(key: "Version", value: "1.0"),
        Property(key: "Rating", value: "4.5")
    ]
    
    var body: some View {
        
        VStack {
            
            Image("BookLogo")
                .resizable()
                .frame(width: 150, height: 150)
            Text("Book Viewer")
                .bold()
                .font(.title2)
            
            Divider()
                .padding()
            
            ScrollView {
                ForEach(properties) { property in
                    HStack {
                        Text("\(property.key):")
                            .bold()
                        Spacer()
                        Text(property.value)
                    }
                    .padding()
                }
            }
            
            Spacer()
            
        }
        
    }
}

struct AccountAboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountAboutScreen()
    }
}
