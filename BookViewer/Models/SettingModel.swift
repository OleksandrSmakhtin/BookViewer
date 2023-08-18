//
//  SettingModel.swift
//  BookViewer
//
//  Created by Роман on 07.08.2023.
//

import SwiftUI

struct Setting: Identifiable, Codable, Hashable {
    let id = UUID()
    
    let value: String
}
