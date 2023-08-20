//
//  FactsViewModel.swift
//  BookViewer
//
//  Created by Роман on 19.08.2023.
//

import SwiftUI

class FactsViewModel: ObservableObject {
    @Published var facts: [Fact] = []
    private let factsService = FactsService()
    
    func fetchFacts(completion: @escaping () -> Void) {
        Task {
            do {
                facts = try await factsService.getFacts()
                completion() // Call the completion closure
            } catch {
                print("Error fetching facts: \(error)")
            }
        }
    }
    
}
