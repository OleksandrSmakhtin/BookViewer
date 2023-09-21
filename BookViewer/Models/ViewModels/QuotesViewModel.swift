//
//  QuotesViewModel.swift
//  BookViewer
//
//  Created by Роман on 18.08.2023.
//

import SwiftUI

class QuotesViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    private let quotesService = QuotesService()
    
    func fetchQuotes(completion: @escaping () -> Void) {
        Task {
            do {
                quotes = try await quotesService.getQuotes()
                completion() // Call the completion closure
            } catch {
                print("Error fetching jokes: \(error)")
            }
        }
    }
    
}
