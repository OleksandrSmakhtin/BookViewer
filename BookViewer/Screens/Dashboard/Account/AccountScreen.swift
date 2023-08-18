//
//  DashboardScreen.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI

struct AccountScreen: View {
    
    let DEFAUTLS = UserDefaults.standard
    let accountHelpers = AccountHelpersClass()
    
    let items: [NavAccount] = [
        NavAccount(title: "Personal info", icon: "person.crop.circle"),
        NavAccount(title: "Notifications", icon: "bell"),
        NavAccount(title: "Help center", icon: "book.closed"),
        NavAccount(title: "About app", icon: "info.circle"),
        NavAccount(title: "Preferences", icon: "gear")
    ]
    
    private var email: String {
        get {
            var emailFromDefaults = DEFAUTLS.string(forKey: "BOOK_USER_EMAIL") ?? ""
            if emailFromDefaults.isEmpty {
                emailFromDefaults = "user@gmail.com"
            }
            return emailFromDefaults
        }
    }
    
    private var name: String {
        get {
           return accountHelpers.extractName(from: email)
        }
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(.orange)
                    .font(.system(size: 60))
                VStack {
                    Text(name)
                        .padding(-1)
                    Text(email)
                }
            }
            
            Rectangle()
                .frame(height: 2)
                .opacity(0.1)
                .padding()
            
            ScrollView {
                ForEach(items) { item in
                    NavigationLink(destination: {
                        switch item.title {
                            case "Personal info":
                                  AccountPersonalInfoScreen(name: name)
                            case "Preferences":
                                  AccountSettingsScreen()
                            case  "Notifications":
                                   NotificationsView()
                            case "Help center":
                                   AccountHelpScreen()
                            case "About app":
                                   AccountAboutScreen()
                            default:
                            EmptyView()
                        }
                    }, label: {
                        VStack {
                            NavLinkView(icon: item.icon, text: item.title, iconSize: 30)
                            Rectangle()
                                .foregroundColor(.secondary)
                                .frame(height: 2)
                                .opacity(0.1)
                                .padding(5)
                        }
                    })
                }
            }
        }
//        .onAppear {
//            email = DEFAUTLS.string(forKey: "BOOK_USER_EMAIL") ?? ""
//            if email.isEmpty {
//                email = "user@gmail.com"
//            }
//            name = accountHelpers.extractName(from: email)
//        }
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
