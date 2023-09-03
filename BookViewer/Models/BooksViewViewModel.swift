//
//  WishlistViewViewModel.swift
//  BookViewer
//
//  Created by Роман on 03.09.2023.
//

import Foundation
import Combine

final class BooksViewViewModel: ObservableObject {
    
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // add to wish list
    func addToWishlist(book: Card) {
        
        guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
        
        DatabaseManager.shared.collectionWishlist(add: book, for: email).sink { [weak self] completion in
            if case .failure(let error) = completion {
                print(error.localizedDescription)
                self?.error = error.localizedDescription
            }
        } receiveValue: { state in
            print(state)
        }.store(in: &subscriptions)

    }
    
    // add to bought books
    
    func addToBooks(book: Card) {
        
        guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
        
        DatabaseManager.shared.collectionBooks(add: book, for: email).sink { [weak self] completion in
            if case .failure(let error) = completion {
                print(error.localizedDescription)
                self?.error = error.localizedDescription
            }
        } receiveValue: { state in
            print(state)
        }.store(in: &subscriptions)

    }
    
}
