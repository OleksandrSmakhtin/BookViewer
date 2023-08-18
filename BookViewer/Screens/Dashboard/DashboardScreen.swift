//
//  DashboardScreen.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct DashboardScreen: View {
    
    var isOnIpad: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        
        VStack {
            if isOnIpad {
                NavigationView {
                    
                    List {
                        NavigationLink(destination: HomeScreen()) {
                            Label("Home", systemImage: "house")
                        }
                        NavigationLink(destination: BooksScreen()) {
                            Label("My Books", systemImage: "text.book.closed")
                        }
                        NavigationLink(destination: TextScreen()) {
                            Label("Text", systemImage: "doc.text")
                        }
                        NavigationLink(destination: AccountScreen()) {
                            Label("Account", systemImage: "person.crop.circle")
                        }
                    }
                    .listStyle(SidebarListStyle())
                    .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
                    
                    HomeScreen()
                }
                .accentColor(.orange)
                
            } else {
                TabView {
                    HomeScreen()
                        .tabItem {
                            TabButtonView(icon: "house", text: "Home")
                        }
                    
                    BooksScreen()
                        .tabItem {
                            TabButtonView(icon: "text.book.closed", text: "My books")
                        }
                    
                    TextScreen()
                        .tabItem {
                            TabButtonView(icon: "doc.text", text: "Text")
                        }
                    
                    AccountScreen()
                        .tabItem {
                            TabButtonView(icon: "person.crop.circle", text: "Account")
                        }
                }
                .accentColor(.orange)
            }
        }
        
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
