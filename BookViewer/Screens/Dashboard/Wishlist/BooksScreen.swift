//
//  BooksScreen.swift
//  BookViewer
//
//  Created by Роман on 09.08.2023.
//

import SwiftUI

struct BooksScreen: View {
    
    @State private var selectedOption = 0
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image("BookLogo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Text("My books")
                    .padding()
                    .bold()
                    .font(.title2)
            }
            .padding()
            
            Picker(selection: $selectedOption, label: Text("")) {
                 Text("Wishlist").tag(0)
                 Text("Books").tag(1)
             }
             .padding()
             .pickerStyle(SegmentedPickerStyle())
            
            if selectedOption == 0 {
                WishlistScreen()
            } else {
                UserBooksScreen()
            }
            
        }
        
    }
}

struct BooksScreen_Previews: PreviewProvider {
    static var previews: some View {
        BooksScreen()
    }
}
