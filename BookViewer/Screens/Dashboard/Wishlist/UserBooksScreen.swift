//
//  UserBooksScreen.swift
//  BookViewer
//
//  Created by Роман on 09.08.2023.
//

import SwiftUI

struct UserBooksScreen: View {
    
    @StateObject var viewModel = BooksViewViewModel()
    
    @State var books: [Card] = []
    
    
    var body: some View {
        
        VStack {
            if books.count == 0 {
                Spacer()
                
                Text("You don't have any books")
                
                Spacer()
            } else {
                
                ScrollView {
                    ForEach(0..<books.count, id: \.self) { index in
                        
                        if index % 2 == 0 {
                            HStack {
                                CardView(image: books[index].image,
                                         title: books[index].title,
                                         price: books[index].price,
                                         rating: books[index].rating,
                                         details: books[index].details,
                                         text: books[index].text,
                                         isPurchased: true
                                )
                                
                                if index + 1 < books.count {
                                    CardView(image: books[index + 1].image,
                                             title: books[index + 1].title,
                                             price: books[index + 1].price,
                                             rating: books[index + 1].rating,
                                             details: books[index + 1].details,
                                             text: books[index + 1].text,
                                             isPurchased: true
                                    )
                                }
                            }
                        }
                        
                    }
                }
                
            }
        }
        //MARK: - Get Books
        .onAppear {
            viewModel.getBooks()
        }
        //MARK: - Bind books
        .onReceive(viewModel.$books) { books in
            self.books = books
        }
        
    }
    
}

struct UserBooksScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserBooksScreen()
    }
}
