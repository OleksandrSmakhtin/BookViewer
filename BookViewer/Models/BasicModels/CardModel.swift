//
//  CardModel.swift
//  BookViewer
//
//  Created by Роман on 04.08.2023.
//

import SwiftUI

struct Card: Identifiable, Codable, Hashable {
    let id = UUID()

    let image: String
    let title: String
    let price: String
    let rating: String
    let details: String
    let text: String
    var isPurchased: Bool
}
