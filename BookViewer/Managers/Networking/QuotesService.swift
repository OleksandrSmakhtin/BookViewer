//
//  QuotesService.swift
//  BookViewer
//
//  Created by Роман on 18.08.2023.
//

import Foundation

struct Quote: Identifiable, Codable {
    let id = UUID()
    
    let quote: String
    let author: String
}

enum QuotesError: Error {
    case invalidURL
    case requestFailed(Error)
}

class QuotesService {
    
    func getQuotes() async throws -> [Quote] {
        let urlString = "https://api.api-ninjas.com/v1/quotes?limit=10"
        
        guard let url = URL(string: urlString) else {
            throw QuotesError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        // Provide headers if needed
        request.setValue("5XVneyxy9YVQ7/wAd6Mkpw==F70jTJkTKe6I19CT", forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let quotesArray = try JSONDecoder().decode([Quote].self, from: data)
            return quotesArray
        } catch {
            throw QuotesError.requestFailed(error)
        }
        
    }
    
}

