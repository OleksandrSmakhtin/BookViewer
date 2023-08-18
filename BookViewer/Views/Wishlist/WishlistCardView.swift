//
//  WishlistCardView.swift
//  BookViewer
//
//  Created by Роман on 08.08.2023.
//

import SwiftUI

struct WishlistCardView: View {
    
    let DEFAULTS = UserDefaults.standard
    
    let image: String
    let title: String
    let price: String
    let rating: String
    let details: String
    let text: String
    @State var isPurchased: Bool
    
    var truncatedTitle: String {
        if title.count <= 30 {
            return title
        } else {
            let index = title.index(title.startIndex, offsetBy: 30)
            return title[..<index] + "..."
        }
    }
    
    @State private var isFullBook = false
    @State private var isFullScreen = false
    @State private var isReading = false
    
    func saveToWishList(isPurchased: Bool) {
        if let savedData = DEFAULTS.object(forKey: "WISHLIST_DATA") as? Data {
            do {
                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
                
                savedWishlist.append(Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased))
                
                let encodedData = try JSONEncoder().encode(savedWishlist)
                DEFAULTS.set(encodedData, forKey: "WISHLIST_DATA")
                
                print("Saved to wishlist. CardView.line56")
            } catch {
                print("Error by receiving or saving wishlist. CardView.line48")
            }
        } else {
            let newCard = Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased)
            do {
                let encodedData = try JSONEncoder().encode([newCard])
                DEFAULTS.set(encodedData, forKey: "WISHLIST_DATA")
                
                print("Saved to wishlist. CardView.line56")
            } catch {
                print("Error by saving wishlist. CardView.line58")
            }
        }
    }

    
    func makeBookName() {
        let isFullBookName = DEFAULTS.bool(forKey: "IS_FULL_BOOK_NAME")
        
        if isFullBookName {
            isFullBook = true
        } else {
            isFullBook = false
        }
    }
    
    let removeFromWishlist: () -> Void
    
    func purchaseBook() {
        if let savedData = DEFAULTS.object(forKey: "BOUGHT_BOOKS_DATA") as? Data {
            do {
                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
                
                savedWishlist.append(Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased))
                
                let encodedData = try JSONEncoder().encode(savedWishlist)
                DEFAULTS.set(encodedData, forKey: "BOUGHT_BOOKS_DATA")
                
                print("Bought book. CardView.line56")
            } catch {
                print("Error by receiving or saving wishlist. CardView.line48")
            }
        } else {
            let newCard = Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased)
            do {
                let encodedData = try JSONEncoder().encode([newCard])
                DEFAULTS.set(encodedData, forKey: "BOUGHT_BOOKS_DATA")
                
                print("Bought the first book. CardView.line56")
            } catch {
                print("Error by saving wishlist. CardView.line58")
            }
        }
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 250)
                } else {
                    ProgressView()
                        .frame(width: 180, height: 250)
                }
            }
            VStack {
                Text(isFullBook ? title : truncatedTitle)
                    .bold()
                    .font(.title3)
                
                HStack {
                    Text(rating)
                    Text(price)
                }
                .padding()
                
                HStack {
                    Button(action: {}, label: {
                        Button(action: {
                            removeFromWishlist()
                        }, label: {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.orange)
                                .font(.system(size: 25))
                        })
                    })
                    .padding()
                    
                }
                
            }
        }
        .onAppear {
            makeBookName()
        }
        .onTapGesture(count: 1) {
            isFullScreen.toggle() // Toggle full screen on single tap
        }
        .fullScreenCover(isPresented: $isFullScreen, content: {
            Spacer()
            VStack {
                
                HStack {
                    Button(action: {
                        withAnimation {
                            isFullScreen.toggle() // Close full screen on button tap
                        }
                    }, label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.orange)
                            .font(.system(size: 30))
                    })
                    .padding()
                    
                    Text(title)
                        .font(.title)
                        .padding()
                }
                
                ScrollView {
                  
                    
                    AsyncImage(url: URL(string: image)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 250)
                        } else {
                            ProgressView()
                                .frame(width: 180, height: 250)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        
                        HStack {
                            Text(rating)
                                .font(.title3)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text(price)
                                .font(.title3)
                        }
                        
                    }
                    
                    VStack {
                        Text("About this book")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .font(.title3)
                        Text(details)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    
                    Spacer()
                }
                
                if isPurchased {
                    
                    Button(action: {
               
                    }, label: {
                        Text("Open book")
                            .frame(maxWidth: 350)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(50)
                            .onTapGesture(count: 1) {
                                isReading.toggle()
                            }
                            .fullScreenCover(isPresented: $isReading, content: {
                                ReadView(text: text)
                            })
                    })
                    .padding()
                    
                } else {
                    Button(action: {
                        purchaseBook()
                        removeFromWishlist()
                    }, label: {
                        Text("Purchase book")
                            .frame(maxWidth: 350)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(50)
                    })
                    .padding()
                }
                
                    Button(action: {
                        removeFromWishlist()
                    }, label: {
                        Text("Remove from wishlist")
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(50)
                    })
                    .padding()
              
            }
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
        })
    }
}

//struct WishlistCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        WishlistCardView(image: "https://www.macworld.com/wp-content/uploads/2023/01/swift_1200home-1.jpg?quality=50&strip=all", title: "The Witcher. The last wish of white wolf", price: "free", rating: "4.8", details: "This book is about the witcher")
//    }
//}
