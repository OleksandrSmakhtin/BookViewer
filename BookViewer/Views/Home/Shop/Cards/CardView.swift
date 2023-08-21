//
//  CardView.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct CardView: View {
    
    let DEFAULTS = UserDefaults.standard
    
    let image: String
    let title: String
    let price: String
    let rating: String
    let details: String
    let text: String
    
    @State var isPurchased: Bool
    
    var truncatedTitle: String {
        print(text)
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
    
    func isPurchasedCheck() {
        if let savedData = DEFAULTS.object(forKey: "BOUGHT_BOOKS_DATA") as? Data {
            do {
                let savedBoughtBooks = try JSONDecoder().decode([Card].self, from: savedData)

                if savedBoughtBooks.contains(where: { $0.title == title }) {
                    isPurchased = true
                }

                print("Checked purchased status. CardView.lineXX")
            } catch {
                print("Error by receiving or checking purchased status. CardView.lineXX")
            }
        }
    }

    func purchaseBook() {
        
        isPurchased = true
        
        if let savedData = DEFAULTS.object(forKey: "BOUGHT_BOOKS_DATA") as? Data {
            do {
                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
                
                savedWishlist.append(Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased))
                
                let encodedData = try JSONEncoder().encode(savedWishlist)
                DEFAULTS.set(encodedData, forKey: "BOUGHT_BOOKS_DATA")
                
                print("Saved to wishlist. CardView.line56")
            } catch {
                print("Error by receiving or saving wishlist. CardView.line48")
            }
        } else {
            let newCard = Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased)
            do {
                let encodedData = try JSONEncoder().encode([newCard])
                DEFAULTS.set(encodedData, forKey: "BOUGHT_BOOKS_DATA")
                
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
    
    func saveToWishList(isPurchased: Bool) {
        if let savedData = DEFAULTS.object(forKey: "WISHLIST_DATA") as? Data {
            do {
                var savedWishlist = try JSONDecoder().decode([Card].self, from: savedData)
                
                print("Received wishlist. CardView.line46")
                
                savedWishlist.append(Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: false))
                
                do {
                    let encodedData = try JSONEncoder().encode(savedWishlist)
                    
                    DEFAULTS.set(encodedData, forKey: "WISHLIST_DATA")
                    
                    print("Saved to wishlist. CardView.line56")
                } catch {
                    print("Error by saving to wishlist. CardView.line58")
                }
                
            } catch {
                print("Error by receiving wishlist. CardView.line48")
            }
        } else {
            
            var savedWishlist: [Card] = []
                
            savedWishlist.append(Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: false))
                
             do {
                let encodedData = try JSONEncoder().encode(savedWishlist)
                    
                DEFAULTS.set(encodedData, forKey: "WISHLIST_DATA")
                    
                print("Saved to wishlist. CardView.line56")
             } catch {
                print("Error by saving to wishlist. CardView.line58")
             }

        }
    }
    
    var body: some View {
        
        VStack {
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
            VStack {
                Text(isFullBook ? title : truncatedTitle)
                    .bold()
                    .font(.title3)
                HStack {
                    Text(rating)
                    Text(price)
                    
                    Spacer()
                    
                    if isPurchased == false {
                        Button(action: {
                            saveToWishList(isPurchased: false)
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.orange)
                        })
                    }
                }
                .padding()
            }
        }
        .onAppear {
             makeBookName()
            
             if !isPurchased {
                 isPurchasedCheck()
             }
        }
        .frame(width: 180, height: 400, alignment: .center)
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
                
                if isPurchased == false {
                    
                    Button(action: {
                        purchaseBook()
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
                    
                    Button(action: {
                        saveToWishList(isPurchased: false)
                    }, label: {
                        Text("Add to wishlist")
                            .frame(maxWidth: 350)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(50)
                    })
                    .padding()
                } else {
                    Button(action: {
                        print("TEXT")
                        print(text)
                    }, label: {
                        Text("Open book")
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(50)
                            .onTapGesture(count: 1) {
                                isReading.toggle()
                            }
                            .fullScreenCover(isPresented: $isReading, content: {
                                Button(action: {
                                    withAnimation {
                                        isReading.toggle() // Close full screen on button tap
                                    }
                                }, label: {
                                    Image(systemName: "x.circle")
                                        .foregroundColor(.orange)
                                        .font(.system(size: 30))
                                })
                                .padding()
                                ReadView(text: text)
                            })
                    })
                    .padding()
                }
              
            }
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
            
        })
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "https://www.macworld.com/wp-content/uploads/2023/01/swift_1200home-1.jpg?quality=50&strip=all", title: "The Witcher. The last wish of white wolf", price: "free", rating: "4.8", details: "This book is about the witcher", text: "The withcer has gone to the forest. He saw there a lot of things! He was impressed.", isPurchased: false)
    }
}
