//
//  AccountHelpContactView.swift
//  BookViewer
//
//  Created by Роман on 10.08.2023.
//

import SwiftUI

struct AccountHelpContactView: View {
    
    let links: [HelpContact] = [
        HelpContact(icon: "TelegramLogo", title: "Telegram"),
        HelpContact(icon: "ViberLogo", title: "Viber")
    ]
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                ForEach(links) { link in
                    Button(action: {}, label: {
                        HStack {
                            Image(link.icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text(link.title)
                                .padding(5)
                                .foregroundColor(.primary)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .border(.gray.opacity(0.2), width: 2)
                        .cornerRadius(10)
                        .padding()
                    })
                }
                
            }
            
        }
        
    }
}

struct AccountHelpContactView_Previews: PreviewProvider {
    static var previews: some View {
        AccountHelpContactView()
    }
}
