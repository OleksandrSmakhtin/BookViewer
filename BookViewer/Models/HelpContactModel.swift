//
//  HelpContactModel.swift
//  BookViewer
//
//  Created by Роман on 10.08.2023.
//

import SwiftUI

struct HelpContact: Identifiable, Codable, Hashable {
    let id = UUID()
    
    let icon: String
    let title: String
}

