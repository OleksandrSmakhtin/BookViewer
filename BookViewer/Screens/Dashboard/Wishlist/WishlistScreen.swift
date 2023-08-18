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
    
    func removeFromWishlist(card: Card) {
        wishlist.removeAll { $0 == card }

        do {
            let encodedData = try JSONEncoder().encode(wishlist)
            DEFAULTS.set(encodedData, forKey: "WISHLIST_DATA")
        } catch {
            print("Error saving updated wishlist. WishlistScreen.line57")
        }
    }
    
    func getWishlist() {
        if let savedData = DEFAULTS.object(forKey: "WISHLIST_DATA") as? Data {
            do {
                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
                
                wishlist = savedWishlist
                
                print("Received wishlist. CardView.line46")
            } catch {
                print("Error by receiving wishlist. CardView.line48")
            }
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
            getWishlist()
        }
    }
    
}

struct WishlistScreen_Previews: PreviewProvider {
    static var previews: some View {
        WishlistScreen()
    }
}
