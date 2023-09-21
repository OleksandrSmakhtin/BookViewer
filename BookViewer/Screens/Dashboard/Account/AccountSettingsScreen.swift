//
//  AccountSettingsScreen.swift
//  BookViewer
//
//  Created by Роман on 06.08.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct AccountSettingsScreen: View {
    
    let settings: [Setting] = [
        Setting(value: "Display book's full title")
    ]
    
    @StateObject var viewModel = LoginViewViewModel()
    
    let DEFAULTS = UserDefaults.standard
    
    @State private var displayFullBookName = false
    
    private func saveSetting(value: Bool, key: String) {
        DEFAULTS.setValue(displayFullBookName, forKey: key)
    }
    
    var body: some View {
        VStack {
            Text("Preferences")
                .bold()
                .font(.title)
            Text("General")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ForEach(settings) { setting in
                HStack {
                    Toggle(isOn: $displayFullBookName) {
                        Text(setting.value)
                    }
                    .onChange(of: displayFullBookName) { newValue in
                        print(newValue)
                        saveSetting(value: newValue, key: "IS_FULL_BOOK_NAME")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .orange))
                }
            }
            .padding()
            
            Spacer()
            
            HStack {
                Button(action: {
                    try? Auth.auth().signOut()
                    DEFAULTS.setValue(false, forKey: "BOOK_IS_REGISTERED")
                }, label: {
                    Text("Sign Out")
                        .frame(width: 120, height: 25, alignment: .center)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                Button(action: {
                    viewModel.deleteUser()
                    DEFAULTS.setValue(false, forKey: "BOOK_IS_REGISTERED")
                }, label: {
                    Text("Delete Account")
                        .frame(width: 120, height: 25, alignment: .center)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
            }

        }
        .padding()
    }
}

struct AccountSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsScreen()
    }
}
