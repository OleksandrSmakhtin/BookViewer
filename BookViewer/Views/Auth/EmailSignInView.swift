//
//  EmailSignInView.swift
//  BookViewer
//
//  Created by Роман on 22.09.2023.
//

import SwiftUI

struct EmailSignInView: View {
    
    // view model
    @StateObject var viewModel = LoginViewViewModel()
    
    @State var loginText = ""
    @State var passwordText = ""
    @State var isValidated = false
    @State private var isSelected = false
    
    @Binding var isRegistered: Bool
    
    var body: some View {
        VStack {
            
            if isSelected {
                TextField("Email", text: $loginText)
                    .padding()
                    .background(.orange)
                    .cornerRadius(10)
                    .frame(width: 300)
                
                TextField("Password", text: $passwordText)
                    .padding()
                    .background(.orange)
                    .cornerRadius(10)
                    .frame(width: 300)
                
                HStack {
                    Button {
                        viewModel.loginUser()
                        isRegistered = true
                        UserDefaults.standard.setValue(isRegistered, forKey: "BOOK_IS_REGISTERED")
                    } label: {
                        Text("Login")
                            .padding()
                            .frame(width: 150)
                            .foregroundColor(.orange)
                            .background(Color.primary)
                            .font(.system(size: 20))
                            .cornerRadius(10)
                            .padding()
                    }
                    .disabled(!isValidated)
                    
                    Button {
                        viewModel.registerUser()
                        isRegistered = true
                        UserDefaults.standard.setValue(isRegistered, forKey: "BOOK_IS_REGISTERED")
                    } label: {
                        Text("Register")
                            .padding()
                            .frame(width: 150)
                            .foregroundColor(.orange)
                            .background(Color.primary)
                            .font(.system(size: 20))
                            .cornerRadius(10)
                            .padding()
                    }
                    .disabled(!isValidated)
                }
                
            } else {
                Button(action: {
                    isSelected = true
                }, label: {
                    LoginButtonView(text: "Continue with email", icon: "envelope.fill", isIcon: true)
                })
            }
            
        }
        .onReceive(viewModel.$isAuthFormValid) { state in
            isValidated = state
        }
        .onChange(of: passwordText) { newValue in
            viewModel.password = newValue
            viewModel.validateLogInForm()
        }
        .onChange(of: loginText) { newValue in
            viewModel.email = newValue
            viewModel.validateLogInForm()
        }
    }
}

//struct EmailSignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmailSignInView()
//    }
//}
