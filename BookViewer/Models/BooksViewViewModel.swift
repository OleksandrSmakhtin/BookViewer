//
//  WishlistViewViewModel.swift
//  BookViewer
//
//  Created by Роман on 03.09.2023.
//

import Foundation
import Combine

final class BooksViewViewModel: ObservableObject {
    
    @Published var wishlist: [Card] = []
    @Published var books: [Card] = []
    
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Wish list
    // get
    func getWishlist() {
        guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
        
        DatabaseManager.shared.collectionWishlist(email: email) { result in
            switch result {
            case .success(let cards):
                self.wishlist = cards
                print(cards)
            
            case .failure(let error):
                print(error)
            }
        }
    }
    
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
    
    // delete from wish list
    func deleteWishlist(book: Card) {
        guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
        
        DatabaseManager.shared.collectionWishlist(delete: book, for: email).sink { [weak self] completion in
            if case .failure(let error) = completion {
                print(error.localizedDescription)
                self?.error = error.localizedDescription
            }
        } receiveValue: { state in
            print("Successfully deleted")
            self.getWishlist()
        }.store(in: &subscriptions)
    }
    
    
    //MARK: - Books
    // get
    func getBooks() {
        guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
        
        DatabaseManager.shared.collectionBooks(email: email) { result in
            switch result {
            case .success(let cards):
                self.books = cards
                print(cards)
            
            case .failure(let error):
                print(error)
            }
        }
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
