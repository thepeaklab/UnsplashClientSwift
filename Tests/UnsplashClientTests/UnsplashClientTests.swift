//
//  UnsplashClientTests.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import XCTest
@testable import UnsplashClient


final class UnsplashClientTests: XCTestCase {

    var client: UnsplashClient!

    override func setUp() {
        super.setUp()

        guard let accessKey = ProcessInfo.processInfo.environment["accessKey"] else {
            fatalError("AccessKey not provided as Environment variable")
        }

        client = UnsplashClient(accessKey: accessKey)
    }

    func testGetRandomImage() {
        let randomImage = try? client.getRandomPhoto().wait()
        XCTAssertNotNil(randomImage)
    }

    func testGetLatestImagesShouldNotBeEmpty() {
        let latestImages = try? client.getLatestPhotos().wait()
        XCTAssertNotNil(latestImages)
        XCTAssertFalse(latestImages!.isEmpty)
    }

    func testSearchForImagesByKeyword() {
        let imagePage = try? client.getPhotosFor(keyword: "Car",
                                                 page: 1,
                                                 perPage: 20,
                                                 orderBy: .latest,
                                                 orientation: .landscape,
                                                 colorFilter: .black).wait()
        let foundImages = imagePage?.photos
        XCTAssertNotNil(foundImages)
        XCTAssertFalse(foundImages!.isEmpty)
    }

    func testGetImageForIdentifier() {
        let client = UnsplashClient(accessKey: "p6w4GrAA2CubxUF44ROf7bUHSNLb5HHfowBqOKlGNIc")

        let image = try? client.getPhotoFor(id: "sgLArb_GGO0").wait()
        print(image)
        XCTAssertNotNil(image)
    }


    static var allTests = [
        ("testGetRandomImage", testGetRandomImage),
        ("testGetLatestImagesShouldNotBeEmpty", testGetLatestImagesShouldNotBeEmpty),
        ("testSearchForImagesByKeyword", testSearchForImagesByKeyword),
        ("testGetImageForIdentifier", testGetImageForIdentifier)
    ]
    
}
