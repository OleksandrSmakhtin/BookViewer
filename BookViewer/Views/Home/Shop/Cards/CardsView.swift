//
//  CardsView.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct CardsView: View {
    
    let cards: [Card]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(cards.chunked(into: 2), id: \.self) { chunk in
                    HStack(spacing: 16) {
                        ForEach(chunk, id: \.self) { card in
                            CardView(image: card.image, title: card.title, price: card.price, rating: card.rating, details: card.details, text: card.text, isPurchased: card.isPurchased)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
}

// Helper extension to split an array into chunks of a given size
extension Array {
    func chunked(into size: Int) -> [ArraySlice<Element>] {
        stride(from: 0, to: count, by: size).map {
            self[$0..<Swift.min($0 + size, count)]
        }
    }
}
