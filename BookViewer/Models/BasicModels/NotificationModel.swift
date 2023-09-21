//
//  NavigationModel.swift
//  BookViewer
//
//  Created by Роман on 05.08.2023.
//

import SwiftUI

struct Notification: Identifiable, Codable, Hashable {
    let id = UUID()
    
    let title: String
    let text: String
}
