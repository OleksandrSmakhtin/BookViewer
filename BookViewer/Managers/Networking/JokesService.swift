//
//  JokesService.swift
//  BookViewer
//
//  Created by Роман on 17.08.2023.
//

import Foundation

struct Joke: Identifiable, Codable {
    let id = UUID()
    
    let joke: String
}

enum JokesError: Error {
    case invalidURL
    case requestFailed(Error)
}

class JokesService {
    
    func getJokes() async throws -> [Joke] {
        let urlString = "https://api.api-ninjas.com/v1/jokes?limit=30"
        
        guard let url = URL(string: urlString) else {
            throw JokesError.invalidURL
        }
        
        var request = URLRequest(url: url)
         
        // Provide headers if needed
        request.setValue("5XVneyxy9YVQ7/wAd6Mkpw==F70jTJkTKe6I19CT", forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let jokesArray = try JSONDecoder().decode([Joke].self, from: data)
            return jokesArray
        } catch {
            throw JokesError.requestFailed(error)
        }
        
    }
    
}
