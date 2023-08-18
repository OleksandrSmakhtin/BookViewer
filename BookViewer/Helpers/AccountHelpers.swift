//
//  AccountHelpers.swift
//  BookViewer
//
//  Created by Роман on 06.08.2023.
//

import Foundation

class AccountHelpersClass {
    
    func extractName(from email: String?) -> String {
        guard let email = email else {
            return "Name"
        }
        
        let components = email.components(separatedBy: "@")
        if let firstComponent = components.first {
            return firstComponent
        } else {
            return "Name"
        }
    }
    
}
