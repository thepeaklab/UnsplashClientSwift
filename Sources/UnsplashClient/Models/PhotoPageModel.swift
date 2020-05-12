//
//  PhotoPageModel.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import Foundation


public struct PhotoPageModel: Codable {

    public let totalCount: Int
    public let totalPages: Int
    public let photos: [PhotoModel]

    enum CodingKeys: String, CodingKey {

        case totalCount = "total"
        case totalPages = "total_pages"
        case photos = "results"

    }

}
