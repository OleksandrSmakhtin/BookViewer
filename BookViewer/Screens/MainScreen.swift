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
                SignInView(isRegistred: $isRegistered)
            }
        }
        .onAppear {
            withAnimation {
                isRegistered = DEFAULTS.bool(forKey: "BOOK_IS_REGISTERED")
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
