//
//  WishlistScreen.swift
//  BookViewer
//
//  Created by Роман on 07.08.2023.
//

import SwiftUI

struct WishlistScreen: View {
    
    let DEFAULTS = UserDefaults.standard
    
    @State var wishlist: [Card] = []
    
    @StateObject var viewModel = BooksViewViewModel()
    
    //MARK: - REMOVE FROM WISHLIST
    func removeFromWishlist(card: Card) {
        wishlist.removeAll { $0 == card }

        do {
            let encodedData = try JSONEncoder().encode(wishlist)
            DEFAULTS.set(encodedData, forKey: "WISHLIST_DATA")
        } catch {
            print("Error saving updated wishlist. WishlistScreen.line57")
        }
    }
    
    var body: some View {
        VStack {
            if wishlist.count == 0 {
                Spacer()
                
                Text("Wishlist is empty")
                
                Spacer()
            } else {
                
                ScrollView {
                    ForEach(wishlist) { wish in
                        WishlistCardView(image: wish.image, title: wish.title, price: wish.price, rating: wish.rating, details: wish.details, text: wish.text, isPurchased: wish.isPurchased, 
                            removeFromWishlist: { removeFromWishlist(card: wish) }
                        )
                    }
                }
                
            }
    
        }.onAppear {
            guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
            
            DatabaseManager.shared.collectionWishlist(email: email) { result in
                switch result {
                case .success(let cards):
                    wishlist = cards
                    print(cards)
                
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

struct WishlistScreen_Previews: PreviewProvider {
    static var previews: some View {
        WishlistScreen()
    }
}
