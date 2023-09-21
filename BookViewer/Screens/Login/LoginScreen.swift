//
//  LoginScreen.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI

struct LoginScreen: View {
    
    // view model
    @StateObject var viewModel = LoginViewViewModel()
    
    @State var loginText = ""
    @State var passwordText = ""
    @State var isValidated = false
    
    @Binding var isRegistered: Bool
    
    var body: some View {
        
        ZStack {
            
            Image("Books")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.3)
            
            VStack {
                
                HStack {
                    Text("Welcome to")
                        .bold()
                        .font(.title)
                    Text("Books Viewer")
                        .bold()
                        .font(.title)
                        .foregroundColor(.orange)
                }
                
                TextField("Email", text: $loginText)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .frame(width: 300)
                    
                
                TextField("Password", text: $passwordText)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .frame(width: 300)
                
                HStack {
                    Button {
                        viewModel.loginUser()
                        isRegistered = true
                    } label: {
                        Text("Login")
                            .padding()
                            .frame(width: 150)
                            .foregroundColor(.black)
                            .background(Color.orange)
                            .font(.system(size: 20))
                            .cornerRadius(10)
                            .padding()
                    }
                    .disabled(!isValidated)
                    
                    Button {
                        viewModel.registerUser()
                        isRegistered = true
                    } label: {
                        Text("Register")
                            .padding()
                            .frame(width: 150)
                            .foregroundColor(.orange)
                            .background(Color.black)
                            .font(.system(size: 20))
                            .cornerRadius(10)
                            .padding()
                    }
                    .disabled(!isValidated)
                    
                }
                
                Text("The Books Viewer is – a place where literature comes alive with mesmerizing images, igniting your imagination with one sentence at a time")
                    .frame(maxWidth: 500)
                    .padding(4)
                    .font(.callout)
                    .italic()
                    .multilineTextAlignment(.center)
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

//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}
