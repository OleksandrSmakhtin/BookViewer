//
//  JokesViewModel.swift
//  BookViewer
//
//  Created by Роман on 17.08.2023.
//

import SwiftUI

class JokesViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    private let jokesService = JokesService()
    
    func fetchJokes(completion: @escaping () -> Void) {
        Task {
            do {
                jokes = try await jokesService.getJokes()
                completion() // Call the completion closure
            } catch {
                print("Error fetching jokes: \(error)")
            }
        }
    }
    
}
