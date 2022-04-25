//
//  ImageGalleryApplicationTests.swift
//  ImageGalleryApplicationTests
//
//  Created by Admin on 22/04/2022.
//

import XCTest
@testable import ImageGalleryApplication

class ImageGalleryApplicationTests: XCTestCase {

    var viewModel:ImageGalleryViewModel!
    var mockNetworkManager:MockNetworkManager!
    
    override func setUpWithError() throws {
        let controller =  ImageGalleryViewController()
        viewModel = ImageGalleryViewModel(delegate: controller)
        mockNetworkManager = MockNetworkManager()
        viewModel.networkManager = mockNetworkManager
    }

    override func tearDownWithError() throws {
        
    }
    
    func testSearchPhotos_success() {
        let searchText = "car"
        viewModel.getImage(search: searchText)
        XCTAssertEqual(viewModel.photoDetailsCount, 100)
        XCTAssertEqual(viewModel.photoRecords.first?.title, "Brabus External Mirror Triangle Sticker")
        
    }

}
