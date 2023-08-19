//
//  AuthorModel.swift
//  BookViewer
//
//  Created by Роман on 18.08.2023.
//

import SwiftUI

struct Author: Identifiable, Codable {
    
    let id = UUID()
    
    let name: String
    let category: String
    let shortInfo: String
    let info: String
    let rating: String
    let image: String
}
