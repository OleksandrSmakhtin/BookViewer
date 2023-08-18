//
//  AccountHelpersTest.swift
//  BookViewerTests
//
//  Created by Роман on 15.08.2023.
//

import XCTest
@testable import BookViewer

final class AccountHelpersTests: XCTestCase {
    
    private let accountHelpersClass = AccountHelpersClass()
    
    func testExtractName() {
        let string = "palchyk.roman@gmail.com"
        let stringReply1 = "palchyk.roman"
        
        let stringResult = accountHelpersClass.extractName(from: string)
        
        XCTAssertEqual(stringResult, stringReply1)
    }
    
}
