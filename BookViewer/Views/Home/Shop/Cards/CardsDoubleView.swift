//
//  CardsDoubleView.swift
//  BookViewer
//
//  Created by Роман on 06.08.2023.
//

import SwiftUI

struct CardsDoubleView: View {
    
    let books: [Card]
    
    func display() {
        for (index, book) in books.enumerated() {
            if index % 2 == 0 {
                print(books[index].text)
                print(books[index + 1].text)
            }
        }
    }
    
    var body: some View {
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
                                 isPurchased: books[index].isPurchased
                        )
                        
                        if index + 1 < books.count {
                            CardView(image: books[index + 1].image,
                                     title: books[index + 1].title,
                                     price: books[index + 1].price,
                                     rating: books[index + 1].rating,
                                     details: books[index + 1].details,
                                     text: books[index + 1].text,
                                     isPurchased: books[index + 1].isPurchased
                            )
                        }
                    }
                }
            }
        }
        .onAppear {
            display()
        }
    }
}

//struct CardsDoubleView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardsDoubleView()
//    }
//}
