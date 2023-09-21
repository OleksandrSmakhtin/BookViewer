//
//  HelpFaqModel.swift
//  BookViewer
//
//  Created by Роман on 10.08.2023.
//

import SwiftUI

struct HelpFaqModel: Identifiable, Codable, Hashable {
    let id = UUID()
    
    let question: String
    let answer: String
    var isOpen: Bool
}
