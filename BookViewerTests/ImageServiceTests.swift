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
            _ = try await imagesService.getImageUrl(query: query)
            XCTFail("Request failed. Query: \(query)")
        } catch {
            
            if case ImagesServiceError.requestFailed = error {
            } else {
                XCTFail("Unexpected error: \(error)")
            }
            
        }
        
    }
    
}
