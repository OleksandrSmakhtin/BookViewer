//
//  AccountSettingsScreen.swift
//  BookViewer
//
//  Created by Роман on 06.08.2023.
//

import SwiftUI

struct AccountSettingsScreen: View {
    
    let settings: [Setting] = [
        Setting(value: "Display book's full title")
    ]
    
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
        }
        .padding()
    }
}

struct AccountSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsScreen()
    }
}
