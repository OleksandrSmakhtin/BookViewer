//
//  UserBooksScreen.swift
//  BookViewer
//
//  Created by Роман on 09.08.2023.
//

import SwiftUI

struct UserBooksScreen: View {
    
    let DEFAULTS = UserDefaults.standard
    
    @State var wishlist: [Card] = []
    
    func getWishlist() {
        if let savedData = DEFAULTS.object(forKey: "BOUGHT_BOOKS_DATA") as? Data {
            do {
                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
                
                var goodWishlist: [Card] = []
                
                for wish in savedWishlist {
                    if wish.title.lowercased() != "random joke" {
                        if wish.title.lowercased() != "random quote" {
                            if wish.title.lowercased() != "random fact" {
                                goodWishlist.append(wish)
                            }
                        }
                    }
                }
                
                wishlist = goodWishlist
                
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
                
                Text("You don't have any books")
                
                Spacer()
            } else {
                
                ScrollView {
                    ForEach(0..<wishlist.count, id: \.self) { index in
                        
                        if index % 2 == 0 {
                            HStack {
                                CardView(image: wishlist[index].image,
                                         title: wishlist[index].title,
                                         price: wishlist[index].price,
                                         rating: wishlist[index].rating,
                                         details: wishlist[index].details,
                                         text: wishlist[index].text,
                                         isPurchased: true
                                )
                                
                                if index + 1 < wishlist.count {
                                    CardView(image: wishlist[index + 1].image,
                                             title: wishlist[index + 1].title,
                                             price: wishlist[index + 1].price,
                                             rating: wishlist[index + 1].rating,
                                             details: wishlist[index + 1].details,
                                             text: wishlist[index + 1].text,
                                             isPurchased: true
                                    )
                                }
                            }
                        }
                        
                    }
                }
                
            }
            
        }.onAppear {
            getWishlist()
        }
        
    }
    
}

struct UserBooksScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserBooksScreen()
    }
}
