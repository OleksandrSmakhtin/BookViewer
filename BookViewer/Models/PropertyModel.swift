//
//  PropertyModel.swift
//  BookViewer
//
//  Created by Роман on 11.08.2023.
//

import SwiftUI

struct Property: Identifiable, Codable, Hashable {
    let id = UUID()
    
    let key: String
    let value: String
}
