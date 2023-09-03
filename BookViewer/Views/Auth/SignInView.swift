//
//  SignInView.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI
import GoogleSignIn
import Firebase

struct SignInView: View {
    
    let DEFAULTS = UserDefaults.standard
    
    @Binding var isRegistred: Bool
    
    @State private var userEmail: String? = nil
    
    @StateObject var viewModel = SignInViewViewModel()
    
    var body: some View {
        VStack {
            if let email = userEmail {
                Text("\(email)")
            } else {
                Button(action: {
                    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let window = scene.windows.first,
                          let presentingViewController = window.rootViewController else {
                        return print("Error: Can't get presenting view controller")
                    }
                    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { user, error in
                        handleSignInResult(result: user, error: error)
                    }
                }) {
                    LoginButtonView(text: "Countiue with Google", icon: "GoogleLogo")
                        .padding()
                }
            }
        }
    }
    
    func handleSignInResult(result: GIDSignInResult?, error: Error?) {
        if let error = error {
            print("Google sign-in error: \(error.localizedDescription)")
            return
        }
        
        if let user = result?.user {
            guard let email = user.profile?.email else {
                return
            }
            
            print("Email \(email)")
            
            viewModel.hadnleAuth(for: email)
            
            userEmail = email
            DEFAULTS.setValue(userEmail, forKey: "BOOK_USER_EMAIL")
            isRegistred = true
            DEFAULTS.setValue(isRegistred, forKey: "BOOK_IS_REGISTERED")
        }
        
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
