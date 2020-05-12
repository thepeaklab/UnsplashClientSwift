//
//  UnsplashClient.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import Foundation
import AsyncHTTPClient
import NIO


public class UnsplashClient {

    private let clientURL = "https://api.unsplash.com"

    private var accessKey: String

    private var defaultHeader: [(String, String)] {
        [
            ("Authorization", "Client-ID \(accessKey)"),
            ("Accept-Version", "v1")
        ]
    }

    private let client: HTTPClient

    public init(accessKey: String) {
        self.accessKey = accessKey
        client = HTTPClient(eventLoopGroupProvider: .shared(MultiThreadedEventLoopGroup(numberOfThreads: 1)))
    }

    deinit {
        try? client.syncShutdown()
    }

}

// MARK: - Internal Helper

internal extension  UnsplashClient {

    func execute<T: Codable>(request: HTTPClient.Request) -> EventLoopFuture<T> {
        client.execute(request: request).flatMapThrowing { response -> T in
            guard let data = response.bodyData else { throw UnsplashClientError.failedToReadBody }
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch let error {
                throw UnsplashClientError.modelDecodingError(error)
            }
        }
    }

    func requestFrom(path: String) -> HTTPClient.Request? {
        try? HTTPClient.Request(url: clientURL + path, method: .GET, headers: .init(defaultHeader))
    }

}

// MARK: - Requests

public extension UnsplashClient {

    /// Gets the lastest 10 images
    /// - Returns: EventLoopFuture<[PhotoModel]>
    func getLatestPhotos(page: Int = 1,
                         perPage: Int = 10,
                         orderBy: PhotoOrder = .latest) -> EventLoopFuture<[PhotoModel]> {
        let path = "/photos?page=\(page)&per_page=\(perPage)&order_by=\(orderBy)"

        guard let request = requestFrom(path: path) else {
            return client.eventLoopGroup.next().makeFailedFuture(UnsplashClientError.invalidRequest)
        }
        return execute(request: request)
    }

    /// Gets one random image
    /// - Returns: EventLoopFuture<PhotoModel>
    func getRandomPhoto() -> EventLoopFuture<PhotoModel> {
        guard let request = requestFrom(path: "/photos/random") else {
            return client.eventLoopGroup.next().makeFailedFuture(UnsplashClientError.invalidRequest)
        }
        return execute(request: request)
    }

    /// Gets  image for identifier
    /// - Returns: EventLoopFuture<PhotoModel>
    func getPhotoFor(id: String) -> EventLoopFuture<PhotoModel> {
        guard let request = requestFrom(path: "/photos/\(id)") else {
            return client.eventLoopGroup.next().makeFailedFuture(UnsplashClientError.invalidRequest)
        }
        return execute(request: request)
    }

    /// Gets  images searched by keywordd
    /// - Returns: EventLoopFuture<PhotoModel>
    func getPhotosFor(keyword: String,
                      page: Int = 1,
                      perPage: Int = 10,
                      orderBy: PhotoOrder = .latest,
                      orientation: PhotoOrientation? = nil,
                      colorFilter: ColorFilter? = nil) -> EventLoopFuture<PhotoPageModel> {
        var path = "/search/photos?query=\(keyword)&page=\(page)&per_page=\(perPage)&order_by=\(orderBy)"

        if let orientation = orientation {
            path.append("&orientation=\(orientation)")
        }
        if let color = colorFilter {
            path.append("&color=\(color)")
        }

        guard let request = requestFrom(path: path) else {
            return client.eventLoopGroup.next().makeFailedFuture(UnsplashClientError.invalidRequest)
        }
        return execute(request: request)
    }

}
