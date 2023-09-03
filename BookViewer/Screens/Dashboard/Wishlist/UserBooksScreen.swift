//
//  UserBooksScreen.swift
//  BookViewer
//
//  Created by Роман on 09.08.2023.
//

import SwiftUI

struct UserBooksScreen: View {
    
    let DEFAULTS = UserDefaults.standard
    
    @State var books: [Card] = []
    
//    func getWishlist() {
//        if let savedData = DEFAULTS.object(forKey: "BOUGHT_BOOKS_DATA") as? Data {
//            do {
//                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
//
//                var goodWishlist: [Card] = []
//
//                for wish in savedWishlist {
//                    if wish.title.lowercased() != "random joke" {
//                        if wish.title.lowercased() != "random quote" {
//                            if wish.title.lowercased() != "random fact" {
//                                goodWishlist.append(wish)
//                            }
//                        }
//                    }
//                }
//
//                wishlist = goodWishlist
//
//                print("Received wishlist. CardView.line46")
//            } catch {
//                print("Error by receiving wishlist. CardView.line48")
//            }
//        }
//    }
    
    var body: some View {
        
        VStack {
            if books.count == 0 {
                Spacer()
                
                Text("You don't have any books")
                
                Spacer()
            } else {
                
                ScrollView {
                    ForEach(0..<books.count, id: \.self) { index in
                        
                        if index % 2 == 0 {
                            HStack {
                                CardView(image: books[index].image,
                                         title: books[index].title,
                                         price: books[index].price,
                                         rating: books[index].rating,
                                         details: books[index].details,
                                         text: books[index].text,
                                         isPurchased: true
                                )
                                
                                if index + 1 < books.count {
                                    CardView(image: books[index + 1].image,
                                             title: books[index + 1].title,
                                             price: books[index + 1].price,
                                             rating: books[index + 1].rating,
                                             details: books[index + 1].details,
                                             text: books[index + 1].text,
                                             isPurchased: true
                                    )
                                }
                            }
                        }
                        
                    }
                }
                
            }
            
        }.onAppear {
            guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
            
            DatabaseManager.shared.collectionBooks(email: email) { result in
                switch result {
                case .success(let cards):
                    books = cards
                    print(cards)
                
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
}

struct UserBooksScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserBooksScreen()
    }
}
