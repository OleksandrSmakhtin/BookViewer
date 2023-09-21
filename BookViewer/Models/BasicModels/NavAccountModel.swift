//
//  NavAccountModel.swift
//  BookViewer
//
//  Created by Роман on 06.08.2023.
//

import SwiftUI

struct NavAccount: Identifiable, Codable, Hashable {
    
    let id = UUID()
    
    let title: String
    let icon: String
}
