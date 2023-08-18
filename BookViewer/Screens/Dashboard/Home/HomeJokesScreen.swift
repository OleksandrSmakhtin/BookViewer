//
//  HomeJokesScreen.swift
//  BookViewer
//
//  Created by Роман on 17.08.2023.
//

import SwiftUI

struct HomeJokesScreen: View {
    
    let DEFAULTS = UserDefaults.standard
    
    @StateObject private var jokesViewModel = JokesViewModel()
    
    @State private var fetchedJokes: [Card] = []
    
    var body: some View {
        VStack {
            Text("Jokes")
                .bold()
                .font(.title)
            CardsDoubleView(books: fetchedJokes)
        }.onAppear {
            jokesViewModel.fetchJokes {
                fetchedJokes = jokesViewModel.jokes.map { joke -> Card in
                    return Card(image: "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781684122783/the-wackiest-joke-book-thatll-knock-knock-you-over-9781684122783_lg.jpg", title: "Random joke", price: "free", rating: "none", details: "Random joke with no author", text: joke.joke, isPurchased: true)
                }
            }
        }
    }
}

struct HomeJokesScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeJokesScreen()
    }
}
