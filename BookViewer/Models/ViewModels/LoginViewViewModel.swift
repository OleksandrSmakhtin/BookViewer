//
//  LoginViewViewModel.swift
//  BookViewer
//
//  Created by Роман on 19.09.2023.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

final class LoginViewViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var email: String?
    @Published var password: String?
    @Published var isAuthFormValid = false
    
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Delete User
    func deleteUser() {
        guard let email = UserDefaults.standard.string(forKey: "BOOK_USER_EMAIL") else { return }
        DatabaseManager.shared.collectionUsers(delete: email).sink { [weak self] completion in
            if case .failure(let error) = completion {
                self?.error = error.localizedDescription
            }
            
        } receiveValue: { state in
            
        }.store(in: &subscriptions)
        
        Auth.auth().currentUser?.delete(completion: { [weak self] error in
            if let error = error {
                self?.error = error.localizedDescription
            } else {
                print("SUCCESSFULLY DELETED USER")
            }
        })
    }
    
    //MARK: - Register user
    func registerUser() {
        guard let email = email, let password = password else { return }
        
        AuthManager.shared.signUpUser(with: email, password: password)
            // handle user output
            .handleEvents(receiveOutput: { [weak self] user in
                self?.user = user
        })
            
            .sink { [weak self] completion in
            // handle errors
            if case .failure(let error) = completion {
                self?.error = error.localizedDescription
            }
            // handle firestore
        } receiveValue: { [weak self] user in
            self?.createUserRecord(for: user)
            UserDefaults.standard.setValue(email, forKey: "BOOK_USER_EMAIL")
        }.store(in: &subscriptions )
        
        
        
    }
    
    //MARK: - Login user
    func loginUser() {
        guard let email = email, let password = password else { return }
        AuthManager.shared.logInUser(with: email, password: password).sink { [weak self] completion in
            // handle errors
            if case .failure(let error) = completion {
                self?.error = error.localizedDescription
            }
        } receiveValue: { [weak self] user in
            self?.user = user
        }.store(in: &subscriptions)
    }
    
    //MARK: - Create user record
    private func createUserRecord(for user: User) {
        guard let userEmail = user.email else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd:MM:yyyy"
        let date = Date()
        
        let bookUser = BookUser(email: userEmail, registrationDate: formatter.string(from: date))
        
        DatabaseManager.shared.collectionUsers(add: bookUser).sink { [weak self] completion in
            if case .failure(let error) = completion {
                print(error.localizedDescription)
                self?.error = error.localizedDescription
            }
        } receiveValue: { state in
            print("ADDING STATE: \(state)")
        }.store(in: &subscriptions)
    }
    
    //MARK: - Validate
    func validateLogInForm() {
        guard let email = email, let password = password else {
            isAuthFormValid = false
            return
        }
        print("email: \(email)\n password:\(password)")
        isAuthFormValid = isValidEmail(email) && password.count >= 6
        print(isAuthFormValid)
    }
    
    //MARK: - email validation
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
