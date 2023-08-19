//
//  AuthorsListView.swift
//  BookViewer
//
//  Created by Роман on 18.08.2023.
//

import SwiftUI

struct AuthorsListView: View {
    
    let authors: [Author]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ForEach(authors) { author in
                HStack {
                    
                    AsyncImage(url: URL(string: author.image)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                        } else {
                            ProgressView()
                                .frame(width: 120, height: 220)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(author.name)
                            .bold()
                            .font(.title3)
                        
                        HStack {
                            Text(author.rating)
                            Divider()
                                .frame(width: 40, height: 30)
                            Text(author.category)
                                .padding(1)
                                .foregroundColor(.gray.opacity(0.6))
                        }
                        .padding()
                        
                    }
                    .padding()
                    
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(colorScheme == .dark ? Color.black : Color.white)
                        .cornerRadius(10)
                        .shadow(
                            color: colorScheme == .dark ? Color.white.opacity(0.3) : Color.gray.opacity(0.3),
                            radius: 8,
                            x: 0,
                            y: 0
                        )
                )
                .padding()
                
            }
        }
        
    }
}

struct AuthorsListView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsListView(authors: [Author(name: "Taras Shevchenko", category: "Poems", shortInfo: "Author writes short poems", info: "Taras Shevchenko is a legendary ukrainian writer.", rating: "4.8", image: "https://en.tchaikovsky-research.net/images/thumb/4/4b/Taras_Shevchenko.jpg/640px-Taras_Shevchenko.jpg"), Author(name: "Taras Shevchenko", category: "Poems", shortInfo: "Author writes short poems", info: "Taras Shevchenko is a legendary ukrainian writer.", rating: "4.8", image: "https://en.tchaikovsky-research.net/images/thumb/4/4b/Taras_Shevchenko.jpg/640px-Taras_Shevchenko.jpg")])
    }
}
