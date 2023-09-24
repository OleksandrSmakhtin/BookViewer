//
//  SignInViewViewModel.swift
//  BookViewer
//
//  Created by Роман on 03.09.2023.
//

import Foundation
import Combine

final class SignInViewViewModel: ObservableObject {
    
    @Published var users = [BookUser]()
    
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    
    //MARK: - Add users
    private func addUser(with email: String) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd:MM:yyyy"
        
        let date = Date()
        
        let user = BookUser(email: email, registrationDate: formatter.string(from: date))
        
        DatabaseManager.shared.collectionUsers(add: user).sink { [weak self] completion in
            if case .failure(let error) = completion {
                print(error.localizedDescription)
                self?.error = error.localizedDescription
            }
        } receiveValue: { state in
            print("ADDING STATE: \(state)")
        }.store(in: &subscriptions)
        
    }
    
    
    //MARK: - Get users
    func getUsers() {
        DatabaseManager.shared.collectionUsers().sink { [weak self] completion in
            if case .failure(let error) = completion {
                print(error.localizedDescription)
                self?.error = error.localizedDescription
            }
        } receiveValue: { [weak self] bookUsers in
            self?.users = bookUsers
        }.store(in: &subscriptions)
    }
    
    //MARK: - Handle auth
    func hadnleAuth(for email: String) {
        let user = users.first { $0.email == email }
        
        if user != nil {
            print("USER EXISTS")
        } else {
            print("USER DO NOT EXIST")
            self.addUser(with: email)
        }
    }
    
}
