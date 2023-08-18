//
//  AccountPersonalInfoScreen.swift
//  BookViewer
//
//  Created by Роман on 06.08.2023.
//

import SwiftUI

struct AccountPersonalInfoScreen: View {
    
    let DEFAULTS = UserDefaults.standard
    
    @State var name: String
    
    func changeName() {
        let email = name + "@gmail.com"
        print(email.lowercased())
        DEFAULTS.setValue(email.lowercased(), forKey: "BOOK_USER_EMAIL")
    }
    
    var body: some View {
        VStack {
            Text("Personal info")
                .padding()
                .bold()
                .font(.title)
            
            Spacer()
            
            VStack {
                HStack {
                    TextField("name", text: $name)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .frame(width: 200)
                        .textCase(.lowercase)
                    Text("@gmail.com")
                }
                .padding()
                Button(action: {
                    changeName()
                }, label: {
                    Text("Change")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.primary)
                        .cornerRadius(10)
                })
            }
            
            Spacer()
            
        }
    }
    
}

struct AccountPersonalInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountPersonalInfoScreen(name: "user")
    }
}
