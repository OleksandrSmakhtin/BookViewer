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
            
            HeaderView()
                .padding()
            
            Picker(selection: $selectedOption, label: Text("")) {
                Text("Wishlist").tag(0)
                Text("Books").tag(1)
                Text("Create book").tag(2)
            }
            .padding()
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            switch selectedOption {
            case 0:
                WishlistScreen()
            case 1:
                UserBooksScreen()
            case 2:
                TextScreen()
            default:
                WishlistScreen()
            }
            
            Spacer()
            
        }
        
    }
}

struct BooksScreen_Previews: PreviewProvider {
    static var previews: some View {
        BooksScreen()
    }
}
