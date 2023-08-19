//
//  AuthorsScreen.swift
//  BookViewer
//
//  Created by Роман on 18.08.2023.
//

import SwiftUI

struct Category: Identifiable, Codable {
    let id = UUID()
    
    let title: String
    let image: String
}

struct AuthorsScreen: View {
    
    let authors: [Author] = [
        Author(name: "Taras Shevchenko", category: "Poems", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.8", image: "https://en.tchaikovsky-research.net/images/thumb/4/4b/Taras_Shevchenko.jpg/640px-Taras_Shevchenko.jpg"),
        Author(name: "Charley Stanley", category: "Quotes", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.5", image: "https://gray-wcsc-prod.cdn.arcpublishing.com/resizer/yQa3vr-7RuUuGp7gqRFRyEkBOuI=/1200x1800/smart/filters:quality(85)/cloudfront-us-east-1.images.arcpublishing.com/gray/H6FZVIV5DFGBXAIUPS2O35HJAY.jpg"),
        Author(name: "Adam Schiff", category: "Quotes", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "3.7", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Adam_Schiff_official_portrait.jpg/1200px-Adam_Schiff_official_portrait.jpg")
    ]
    
    let bestAuthors: [Author] = [
        Author(name: "Robert Frost", category: "Poems", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.9", image: "https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/robert-frost-pencil-greg-joens.jpg"),
        Author(name: "Taras Shevchenko", category: "Poems", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.8", image: "https://en.tchaikovsky-research.net/images/thumb/4/4b/Taras_Shevchenko.jpg/640px-Taras_Shevchenko.jpg"),
        Author(name: "Percy Shelley", category: "Poems", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.8", image: "https://upload.wikimedia.org/wikipedia/commons/5/57/Percy_Bysshe_Shelley_by_Alfred_Clint.jpg")
    ]
    
    let allAuthors: [Author] = [
        Author(name: "Taras Shevchenko", category: "Poems", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.8", image: "https://en.tchaikovsky-research.net/images/thumb/4/4b/Taras_Shevchenko.jpg/640px-Taras_Shevchenko.jpg"),
        Author(name: "Robert Frost", category: "Poems", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.9", image: "https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/robert-frost-pencil-greg-joens.jpg"),
        Author(name: "Charley Stanley", category: "Quotes", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.5", image: "https://gray-wcsc-prod.cdn.arcpublishing.com/resizer/yQa3vr-7RuUuGp7gqRFRyEkBOuI=/1200x1800/smart/filters:quality(85)/cloudfront-us-east-1.images.arcpublishing.com/gray/H6FZVIV5DFGBXAIUPS2O35HJAY.jpg"),
        Author(name: "Adam Schiff", category: "Quotes", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "3.7", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Adam_Schiff_official_portrait.jpg/1200px-Adam_Schiff_official_portrait.jpg"),
        Author(name: "Percy Shelley", category: "Poems", shortInfo: "A legendary writer", info: "A Ukraninian writer with tones of poems", rating: "4.8", image: "https://upload.wikimedia.org/wikipedia/commons/5/57/Percy_Bysshe_Shelley_by_Alfred_Clint.jpg"),
        Author(name: "Chuck Norris", category: "Jokes", shortInfo: "Jokes director", info: "Famous jokes director and member of rotten tomatoes", rating: "4.6", image: "https://flxt.tmsimg.com/assets/73040_v9_ba.jpg")
    ]
    
    var categories: [Category] = [
        Category(title: "Poems", image: "😌"),
        Category(title: "Jokes", image: "😜"),
        Category(title: "Quotes", image: "🥸")
    ]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationStack {
            
            HeaderView()
                .padding()
            
            ScrollView {
                HStack {
                    Text("Best Authors")
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    NavigationLink(destination: AuthorsCatalogScreen(authors: allAuthors), label: {
                        Text("See All")
                            .foregroundColor(.orange)
                    })
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(bestAuthors) { author in
                            HStack {
                                
                                AsyncImage(url: URL(string: author.image)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 120, height: 120)
                                    } else {
                                        ProgressView()
                                            .frame(width: 120, height: 120)
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
                
                VStack {
                    Text("Categories")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                    ScrollView(.horizontal) {
                        HStack(spacing: 40) {
                            ForEach(categories) { category in
                                VStack {
                                    Text(category.image)
                                        .font(.system(size: 40))
                                    Text(category.title)
                                        .font(.title3)
                                }
                                .padding()
                            }
                        }
                    }
                }
                .padding()
                
                HStack {
                    Text("Featured authors")
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    NavigationLink(destination: AuthorsCatalogScreen(authors: allAuthors), label: {
                        Text("See All")
                            .foregroundColor(.orange)
                    })
                }
                .padding()
                
                AuthorsListView(authors: authors)
                
                Spacer()
            }
            
            
            
        }
        
    }
}

struct AuthorsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsScreen()
    }
}
