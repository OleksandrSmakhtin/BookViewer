//
//  FactsService.swift
//  BookViewer
//
//  Created by Роман on 19.08.2023.
//

import Foundation

struct Fact: Identifiable, Codable {
    let id = UUID()
    
    let fact: String
}

enum FactsError: Error {
    case invalidURL
    case requestFailed(Error)
}

class FactsService {
    
    func getFacts() async throws -> [Fact] {
        let urlString = "https://api.api-ninjas.com/v1/facts?limit=30"
        
        guard let url = URL(string: urlString) else {
            throw FactsError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        // Provide headers if needed
        request.setValue("5XVneyxy9YVQ7/wAd6Mkpw==F70jTJkTKe6I19CT", forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let factsArray = try JSONDecoder().decode([Fact].self, from: data)
            return factsArray
        } catch {
            throw FactsError.requestFailed(error)
        }
        
    }
    
}
