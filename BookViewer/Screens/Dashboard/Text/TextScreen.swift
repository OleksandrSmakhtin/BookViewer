//
//  TextScreen.swift
//  BookViewer
//
//  Created by Роман on 14.08.2023.
//

import SwiftUI

struct TextScreen: View {
    
    @State private var text: String = ""
    @State private var isBookCreated: Bool = false
    
    let DEFAULTS = UserDefaults.standard
    
    @Environment(\.colorScheme) var colorScheme
    
    func createBook() {
        
       isBookCreated = true
        
        if let savedData = DEFAULTS.object(forKey: "BOUGHT_BOOKS_DATA") as? Data {
            do {
                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
                
                savedWishlist.append(Card(image: "https://www.macworld.com/wp-content/uploads/2023/01/swift_1200home-1.jpg?quality=50&strip=all", title: "My book", price: "free", rating: "none", details: "User's book", text: text, isPurchased: false))
                
                let encodedData = try JSONEncoder().encode(savedWishlist)
                DEFAULTS.set(encodedData, forKey: "BOUGHT_BOOKS_DATA")
                
                print("Saved to wishlist. CardView.line56")
            } catch {
                print("Error by receiving or saving wishlist. CardView.line48")
            }
        } else {
            let newCard = Card(image: "https://www.macworld.com/wp-content/uploads/2023/01/swift_1200home-1.jpg?quality=50&strip=all", title: "My book", price: "free", rating: "none", details: "User's book", text: text, isPurchased: false)
            do {
                let encodedData = try JSONEncoder().encode([newCard])
                DEFAULTS.set(encodedData, forKey: "BOUGHT_BOOKS_DATA")
                
                print("Saved to wishlist. CardView.line56")
            } catch {
                print("Error by saving wishlist. CardView.line58")
            }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter your text", text: $text)
                .padding()
                .background(
                    Rectangle()
                        .fill(colorScheme == .dark ? Color.black : Color.white)
                        .cornerRadius(10)
                        .shadow(
                            color: colorScheme == .dark ? Color.white.opacity(0.3) : Color.gray.opacity(0.3),
                            radius: 8,
                            x: 0,
                            y: 0
                         )
                )
                .padding()
            
            Button(action: {
                if !text.isEmpty {
                    createBook()
                }
            }, label: {
                Text("Make book")
                    .foregroundColor(.primary)
                    .padding()
                    .background(
                        Rectangle()
                            .fill(colorScheme == .dark ? Color.black : Color.white)
                            .cornerRadius(10)
                            .shadow(
                                color: colorScheme == .dark ? Color.white.opacity(0.3) : Color.gray.opacity(0.3),
                                radius: 8,
                                x: 0,
                                y: 0
                             )
                    )
                    .padding()
            })
            
            if isBookCreated {
                Text("Book's been successfully created!")
            }
            
        }
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen()
    }
}
