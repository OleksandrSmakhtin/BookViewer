//
//  ImageServiceTests.swift
//  BookViewerTests
//
//  Created by Роман on 15.08.2023.
//

import XCTest
@testable import BookViewer

final class ImageServiceTests: XCTestCase {
    
    private let imagesService = ImagesService()

    func testImagesServiceRequestFailed() async {
        let query = "minimal"
        
        do {
            let response = try await imagesService.getImageUrl(query: query)
            XCTAssertNotNil(response)
        } catch {
            
            if case ImagesServiceError.requestFailed = error {
            } else {
                XCTFail("Request failed with query: \(query)")
            }
            
        }
        
    }
    
}
