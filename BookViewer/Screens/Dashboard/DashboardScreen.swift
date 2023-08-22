//
//  DashboardScreen.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct DashboardScreen: View {
    
    @State var selectedScreen = 0
    @State var isTagOpened = false
    @State var tagValue = ""
    @State var resetTag = false
    
    private let tags: [Tag] = [
        Tag(value: "Shevchenko"),
        Tag(value: "John Donne"),
        Tag(value: "Robert Frost")
    ]
    
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
                    if isTagOpened {
                        NavBarIpad(resetTag: $isTagOpened, selectedScreen: $selectedScreen)
                        HomeAllBooksScreen(query: tagValue)
                        TagsClosedBarIpad(isTagOpened: $isTagOpened)
                    } else {
                        NavBarIpad(resetTag: $isTagOpened, selectedScreen: $selectedScreen)
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
                        TagsBarIpad(tags: tags, isTagOpened: $isTagOpened, tagValue: $tagValue)
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

struct TagsBarIpad: View {
    
    let tags: [Tag]
    @Binding var isTagOpened: Bool
    @Binding var tagValue: String
    
    var body: some View {
        
        VStack {
            Text("Featured tags")
                .font(.title2)
                .padding()
                .bold()
            HStack {
                Divider()
                VStack {
                    ScrollView {
                        ForEach(tags) { tag in
                            Button(action: {
                                withAnimation {
                                    isTagOpened = true
                                    tagValue = tag.value
                                }
                            }, label: {
                                Text("#\(tag.value)")
                                    .font(.title3)
                                    .padding()
                            })
                        }
                    }
                    .padding()
                }
                .padding()
            }
        }
        .padding()
        
    }
    
}

struct TagsClosedBarIpad: View {
    
    @Binding var isTagOpened: Bool
    
    var body: some View {
        VStack {
            Text("Featured tags")
                .font(.title2)
                .padding()
                .bold()
            HStack {
                Divider()
                VStack {
                    ScrollView {
                        Button(action: {
                            isTagOpened = false
                        }, label: {
                            HStack {
                                Text("Return")
                                Image(systemName: "return")
                            }
                            .padding()
                            .font(.title3)
                        })
                        .padding()
                    }
                    .padding()
                }
                .padding()
            }
        }
        .padding()
    }
    
}

struct Tag: Identifiable, Codable {
    let id = UUID()
    
    let value: String
}

struct NavBarIpad: View {
    
    @Binding var resetTag: Bool
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
                                resetTag = false
                                selectedScreen = 0
                            }
                        }, label: {
                            Label("Home", systemImage: selectedScreen == 0 ? "house.fill" : "house")
                                .font(.title2)
                                .padding()
                                .bold(selectedScreen == 0 ? true : false)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            withAnimation {
                                resetTag = false
                                selectedScreen = 1
                            }
                        }, label: {
                            Label("My books", systemImage: selectedScreen == 1 ? "text.book.closed.fill" : "text.book.closed")
                                .font(.title2)
                                .padding()
                                .bold(selectedScreen == 1 ? true : false)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            withAnimation {
                                resetTag = false
                                selectedScreen = 2
                            }
                        }, label: {
                            Label("Authors", systemImage: selectedScreen == 2 ? "person.text.rectangle.fill" : "person.text.rectangle")
                                .font(.title2)
                                .padding()
                                .bold(selectedScreen == 2 ? true : false)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            withAnimation {
                                resetTag = false
                                selectedScreen = 3
                            }
                        }, label: {
                            Label("Account", systemImage: selectedScreen == 3 ? "person.crop.circle.fill" : "person.crop.circle")
                                .font(.title2)
                                .padding()
                                .bold(selectedScreen == 3 ? true : false)
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
                                resetTag = false
                                selectedScreen = 0
                            }
                        }, label: {
                            Label("", systemImage: selectedScreen == 0 ? "house.fill" : "house")
                                .font(.title2)
                                .padding()
                        })
                        
                        Button(action: {
                            withAnimation {
                                resetTag = false
                                selectedScreen = 1
                            }
                        }, label: {
                            Label("", systemImage: selectedScreen == 1 ? "text.book.closed.fill" : "text.book.closed")
                                .font(.title2)
                                .padding()
                        })
                        
                        Button(action: {
                            withAnimation {
                                resetTag = false
                                selectedScreen = 2
                            }
                        }, label: {
                            Label("", systemImage: selectedScreen == 2 ? "person.text.rectangle.fill" : "person.text.rectangle")
                                .font(.title2)
                                .padding()
                        })
                        
                        Button(action: {
                            withAnimation {
                                resetTag = false
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
