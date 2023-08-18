//
//  SplashScreen.swift
//  BookViewer
//
//  Created by Роман on 03.08.2023.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Image("AppLogo")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
