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
    func collectionUsers() -> AnyPublisher<[BookUser], Error>{
        db.collection(usersPath).getDocuments()
            .tryMap(\.documents)
            .tryMap { snapshots in
                try snapshots.map({
                    try $0.data(as: BookUser.self)
                })
            }.eraseToAnyPublisher()
    }
    
    // delete
    func collectionUsers(delete email: String) -> AnyPublisher<Bool, Error> {
        db.collection(usersPath).document(email).delete().map { _ in
            return true
        }.eraseToAnyPublisher()
    }
    
    // MARK: - Wish list
    
    // Add
    func collectionWishlist(add book: Card, for email: String) -> AnyPublisher<Bool, Error> {
        return db.collection("\(usersPath)/\(email)\(wishlistPath)").document(book.title).setData(from: book).map { _ in
            return true
        }.eraseToAnyPublisher()
    }
    
    // delete
    func collectionWishlist(delete book: Card, for email: String) -> AnyPublisher<Bool, Error> {
        db.collection("\(usersPath)/\(email)\(wishlistPath)").document(book.title).delete().map { _ in
            return true
        }.eraseToAnyPublisher()
    }
    
    // get
    func collectionWishlist(for email: String) -> AnyPublisher<[Card], Error>{
        db.collection("\(usersPath)/\(email)\(wishlistPath)").getDocuments()
            .tryMap(\.documents)
            .tryMap { snapshots in
                try snapshots.map({
                    try $0.data(as: Card.self)
                })
            }.eraseToAnyPublisher()
    }
    
    // MARK: - Bought books
    // Add
    func collectionBooks(add book: Card, for email: String) -> AnyPublisher<Bool, Error> {
        return db.collection("\(usersPath)/\(email)\(booksPath)").document(book.title).setData(from: book).map { _ in
            return true
        }.eraseToAnyPublisher()
    }
    
    // delete
    func collectionBooks(delete book: Card, for email: String) -> AnyPublisher<Bool, Error> {
        db.collection("\(usersPath)/\(email)\(booksPath)").document(book.title).delete().map { _ in
            return true
        }.eraseToAnyPublisher()
    }
    
    // get
    func collectionBooks(for email: String) -> AnyPublisher<[Card], Error>{
        db.collection("\(usersPath)/\(email)\(booksPath)").getDocuments()
            .tryMap(\.documents)
            .tryMap { snapshots in
                try snapshots.map({
                    try $0.data(as: Card.self)
                })
            }.eraseToAnyPublisher()
    }
}
