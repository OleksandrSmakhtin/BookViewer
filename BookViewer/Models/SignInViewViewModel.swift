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
    
    
    func hadnleAuth(for email: String) {
        
        DatabaseManager.shared.collectionUsers { result in
            
            switch result {
            case .success(let users):
                
                let user = users.first { $0.email == email }
                
                if user != nil {
                    print("USER EXISTS")
                } else {
                    print("USER DO NOT EXIST")
                    self.addUser(with: email)
                }
            
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}
