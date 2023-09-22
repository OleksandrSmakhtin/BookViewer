//
//  LoginScreen.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI

struct LoginScreen: View {
    
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
                
                Text("The Books Viewer is – a place where literature comes alive with mesmerizing images, igniting your imagination with one sentence at a time")
                    .frame(maxWidth: 500)
                    .padding(4)
                    .font(.callout)
                    .italic()
                    .multilineTextAlignment(.center)
            }
            
        }
    }
}

//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}
