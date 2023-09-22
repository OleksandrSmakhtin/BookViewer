//
//  MainScreen.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI

struct MainScreen: View {
    
    let DEFAULTS = UserDefaults.standard
    
    @State var isRegistered = false
    
    var body: some View {
        VStack {
            if isRegistered {
                DashboardScreen()
            } else {
                LoginScreen()
                ScrollView {
                    SignInView(isRegistred: $isRegistered)
                    EmailSignInView(isRegistered: $isRegistered)
                }
                .frame(height: 200)
            }
        }
        .onAppear {
            withAnimation {
                // Start a timer that fires every 2 seconds
                let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                    // Fetch the value from UserDefaults
                    isRegistered = UserDefaults.standard.bool(forKey: "BOOK_IS_REGISTERED")
                }
                // Ensure the timer is scheduled on the main run loop
                RunLoop.main.add(timer, forMode: .common)
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
