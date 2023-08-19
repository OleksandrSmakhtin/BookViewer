//
//  AuthorsCatalogScreen.swift
//  BookViewer
//
//  Created by Роман on 18.08.2023.
//

import SwiftUI

struct AuthorsCatalogScreen: View {
    
    @State private var query = ""
    @State private var allAuthors: [Author] = []
    @State private var wasSearched: Bool = false
    
    @State var authors: [Author]
    
    func searchAuthor() {
        if wasSearched {
            authors = allAuthors
            authors = authors.filter { $0.name.localizedCaseInsensitiveContains(query) }
        } else {
            if !query.isEmpty {
                allAuthors = authors
                wasSearched = true
                authors = authors.filter { $0.name.localizedCaseInsensitiveContains(query) }
            }
        }
    }
    
    func clearSearch() {
        query = ""
        authors = allAuthors
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    searchAuthor()
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.primary)
                })
                
                TextField("Search", text: $query)
                
                if !query.isEmpty {
                    Button(action: {
                        clearSearch()
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.primary)
                    })
                }
                
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .cornerRadius(10)
            .padding()
            Spacer()
            
            ScrollView {
                AuthorsListView(authors: authors)
            }
        }
        
    }
    
}

struct AuthorsCatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsCatalogScreen(authors: [Author(name: "Taras Shevchenko", category: "Poems", shortInfo: "Author writes short poems", info: "Taras Shevchenko is a legendary ukrainian writer.", rating: "4.8", image: "https://en.tchaikovsky-research.net/images/thumb/4/4b/Taras_Shevchenko.jpg/640px-Taras_Shevchenko.jpg"), Author(name: "Shevchenko", category: "Poems", shortInfo: "Author writes short poems", info: "Taras Shevchenko is a legendary ukrainian writer.", rating: "4.8", image: "https://en.tchaikovsky-research.net/images/thumb/4/4b/Taras_Shevchenko.jpg/640px-Taras_Shevchenko.jpg")])
    }
}
