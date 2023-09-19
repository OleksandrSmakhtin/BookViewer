//
//  WishlistScreen.swift
//  BookViewer
//
//  Created by Роман on 07.08.2023.
//

import SwiftUI
import Combine

struct WishlistScreen: View {
    
    //MARK: - Propeties
    @State var wishlist: [Card] = []
    @StateObject var viewModel = BooksViewViewModel()
        
    //MARK: - REMOVE FROM WISHLIST
    func removeFromWishlist(card: Card) {
        viewModel.deleteWishlist(book: card)
        viewModel.addToBooks(book: card)
    }
    
    //MARK: - Body
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
        }
        //MARK: - Get wishlist
        .onAppear {
            viewModel.getWishlist()
        }
        //MARK: - Bind wishlist
        .onReceive(viewModel.$wishlist) { wishlist in
            self.wishlist = wishlist
        }
    }
}

//MARK: - Previews
struct WishlistScreen_Previews: PreviewProvider {
    static var previews: some View {
        WishlistScreen()
    }
}
