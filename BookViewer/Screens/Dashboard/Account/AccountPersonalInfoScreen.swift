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
                    // text field
                    TextField("name", text: $name)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .frame(width: 200)
                        .textCase(.lowercase)
                    Text("@gmail.com")
                }
                .padding(.top, 0)
                
                // change btn
                Button(action: {
                    changeName()
                }, label: {
                    Text("Change")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                .padding(.bottom, 100)
                
                HStack(alignment: .bottom, spacing: 30) {
                    Button(action: {
                        changeName()
                    }, label: {
                        Text("Sign out")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        changeName()
                    }, label: {
                        Text("Delete account")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                }.padding(.top, 300)
                
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
