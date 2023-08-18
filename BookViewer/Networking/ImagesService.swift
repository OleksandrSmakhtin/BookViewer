//
//  ImagesService.swift
//  BookViewer
//
//  Created by Роман on 12.08.2023.
//

import Foundation

struct Results: Codable {
    let results: [Post]
}

struct Post: Identifiable, Codable {
    let id = UUID()
    
    let urls: Urls
}

struct Urls: Codable {
    let full: String
}

enum ImagesServiceError: Error {
    case invalidURL
    case requestFailed(Error)
}

class ImagesService {
    
    private let API_KEY = "pEH6YAF3jfRTYjBngFtywMvlQZiBltiF-o_6TNOSWCE"
    
    func getImageUrl(query: String) async throws -> String? {
           let urlString = "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(API_KEY)"
           
           guard let url = URL(string: urlString) else {
               throw ImagesServiceError.invalidURL
           }
           
           do {
               let (data, _) = try await URLSession.shared.data(from: url)
               let results = try JSONDecoder().decode(Results.self, from: data)
               return results.results.first?.urls.full
           } catch {
               throw ImagesServiceError.requestFailed(error)
           }
    }
    
}


