//
//  DatabaseManager.swift
//  BookViewer
//
//  Created by Роман on 03.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift
import Combine

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let db = Firestore.firestore()
    
    private let usersPath = "Users"
    private let wishlistPath = "/wishlist"
    private let booksPath = "/books"
    
    
    // MARK: - Users
    // add
    func collectionUsers(add user: BookUser) -> AnyPublisher<Bool, Error> {
        return db.collection(usersPath).document(user.email).setData(from: user).map { _ in
            return true
        }
        .eraseToAnyPublisher()
    }
    
    // get
    func collectionUsers(completion: @escaping (Result<[BookUser], Error>) -> Void) {
        db.collection(usersPath).getDocuments { querySnapshot, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            var users: [BookUser] = []
            
            for document in querySnapshot!.documents {
                let data = document.data()
                if let registrationDate = data["registrationDate"] as? String,
                   let email = data["email"] as? String {
                    
                    let user = BookUser(email: email, registrationDate: registrationDate)
                    users.append(user)
                }
            }
            
            print(users)
            
            completion(.success(users))
        }
    }
    
    // MARK: - Wish list
    
    // Add
    func collectionWishlist(add book: Card, for email: String) -> AnyPublisher<Bool, Error> {
        return db.collection("\(usersPath)/\(email)\(wishlistPath)").document(book.title).setData(from: book).map { _ in
            return true
        }.eraseToAnyPublisher()
    }
    
    // get
    func collectionWishlist(email: String, completion: @escaping (Result<[Card], Error>) -> Void) {
        db.collection("\(usersPath)/\(email)\(wishlistPath)").getDocuments { querySnapshot, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            var cards: [Card] = []
            
            for document in querySnapshot!.documents {
                let data = document.data()
                if let title = data["title"] as? String,
                   let image = data["image"] as? String,
                   let isPurchased = data["isPurchased"] as? Bool,
                   let details = data["details"] as? String,
                   let text = data["text"] as? String,
                   let price =  data["price"] as? String,
                   let rating =  data["rating"] as? String {
                    
                    let card = Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased)
                    cards.append(card)
                }
            }
            
            print(cards)
            
            completion(.success(cards))
        }
    }
    
    // MARK: - Bought books
    
    // Add
    func collectionBooks(add book: Card, for email: String) -> AnyPublisher<Bool, Error> {
        return db.collection("\(usersPath)/\(email)\(booksPath)").document(book.title).setData(from: book).map { _ in
            return true
        }.eraseToAnyPublisher()
    }
    
    // get
    func collectionBooks(email: String, completion: @escaping (Result<[Card], Error>) -> Void) {
        db.collection("\(usersPath)/\(email)\(booksPath)").getDocuments { querySnapshot, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            var cards: [Card] = []
            
            for document in querySnapshot!.documents {
                let data = document.data()
                if let title = data["title"] as? String,
                   let image = data["image"] as? String,
                   let isPurchased = data["isPurchased"] as? Bool,
                   let details = data["details"] as? String,
                   let text = data["text"] as? String,
                   let price =  data["price"] as? String,
                   let rating =  data["rating"] as? String {
                    
                    let card = Card(image: image, title: title, price: price, rating: rating, details: details, text: text, isPurchased: isPurchased)
                    cards.append(card)
                }
            }
            
            print(cards)
            
            completion(.success(cards))
        }
    }
    
    
}
