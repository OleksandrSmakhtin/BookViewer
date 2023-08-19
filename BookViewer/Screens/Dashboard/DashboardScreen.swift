//
//  DashboardScreen.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct DashboardScreen: View {
    
    @State var selectedScreen = 0
    
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
                HStack {
                    NavBarIpad(selectedScreen: $selectedScreen)
                    switch selectedScreen {
                    case 1:
                        BooksScreen()
                    case 2:
                        AuthorsScreen()
                    case 3:
                        AccountScreen()
                    default:
                        HomeScreen()
                    }
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
                    
                    AuthorsScreen()
                        .tabItem {
                            TabButtonView(icon: "person.text.rectangle", text: "Authors")
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

struct NavBarIpad: View {
    
    @Binding var selectedScreen: Int
    @State private var isNavDisplayed = false
    
    var width: [CGFloat] {
        let generalWidth: CGFloat = isNavDisplayed ? 250 : 125
        let minWidth: CGFloat = isNavDisplayed ? 200 : 100
        return [generalWidth, minWidth]
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    withAnimation {
                        isNavDisplayed.toggle()
                    }
                }, label: {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 35))
                        .padding(.bottom, 50)
                        .padding(.leading, 25)
                })
                Spacer()
            }
            
            if isNavDisplayed {
                HStack {
                    VStack(alignment: .leading, spacing: 30) {
                        Button(action: {
                            withAnimation {
                                selectedScreen = 0
                            }
                        }, label: {
                            Label("Home", systemImage: "house")
                                .font(.title2)
                                .padding()
                                .foregroundColor(selectedScreen == 0 ? Color.primary : Color.orange)
                                .background(selectedScreen == 0 ? Color.orange : Color.clear)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedScreen = 1
                            }
                        }, label: {
                            Label("My books", systemImage: "text.book.closed")
                                .font(.title2)
                                .padding()
                                .foregroundColor(selectedScreen == 1 ? Color.primary : Color.orange)
                                .background(selectedScreen == 1 ? Color.orange : Color.clear)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedScreen = 2
                            }
                        }, label: {
                            Label("Authors", systemImage: "person.text.rectangle")
                                .font(.title2)
                                .padding()
                                .foregroundColor(selectedScreen == 2 ? Color.primary : Color.orange)
                                .background(selectedScreen == 2 ? Color.orange : Color.clear)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedScreen = 3
                            }
                        }, label: {
                            Label("Account", systemImage: "person.crop.circle")
                                .font(.title2)
                                .padding()
                                .foregroundColor(selectedScreen == 3 ? Color.primary : Color.orange)
                                .background(selectedScreen == 3 ? Color.orange : Color.clear)
                                .cornerRadius(5)
                        })
                        Spacer()
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Divider()
                }
            } else {
                HStack {
                    VStack(spacing: 30) {
                        Button(action: {
                            withAnimation {
                                selectedScreen = 0
                            }
                        }, label: {
                            Label("", systemImage: selectedScreen == 0 ? "house.fill" : "house")
                                .font(.title2)
                                .padding()
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedScreen = 1
                            }
                        }, label: {
                            Label("", systemImage: selectedScreen == 1 ? "text.book.closed.fill" : "text.book.closed")
                                .font(.title2)
                                .padding()
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedScreen = 2
                            }
                        }, label: {
                            Label("", systemImage: selectedScreen == 2 ? "person.text.rectangle.fill" : "person.text.rectangle")
                                .font(.title2)
                                .padding()
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedScreen = 3
                            }
                        }, label: {
                            Label("", systemImage: selectedScreen == 3 ? "person.crop.circle.fill" : "person.crop.circle")
                                .font(.title2)
                                .padding()
                        })
                        Spacer()
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Divider()
                }
            }
        }
        .padding(10)
        .padding(.top, 25)
        .frame(minWidth: width[1], idealWidth: width[0], maxWidth: width[0], alignment: .leading)
        
    }
    
}


struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
