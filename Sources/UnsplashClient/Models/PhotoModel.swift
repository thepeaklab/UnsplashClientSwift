//
//  PhotoModel.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import Foundation


public struct PhotoModel: Codable {

    public let id: String
    public let creationDate: String
    public let lastUpdateDate: String
    public let likes: Int
    public let likedByUser: Bool

    public let user: UserModel
    public let location: LocationModel?
    public let exif: ExifModel?

    public let width: Int
    public let height: Int
    public let colorHex: String
    public let views: Int?
    public let downloads: Int?
    public let description: String?
    public let alternativeDescription: String?

    public let urls: PhotoURL
    public let links: PhotoLinks

}


extension PhotoModel {

    enum CodingKeys: String, CodingKey {

        case id
        case creationDate = "created_at"
        case lastUpdateDate = "updated_at"
        case likes
        case likedByUser = "liked_by_user"
        case user
        case location
        case exif
        case width
        case height
        case colorHex = "color"
        case views
        case downloads
        case description
        case alternativeDescription = "alt_description"
        case urls
        case links

    }

    public struct PhotoLinks: Codable {

        public let origin: String
        public let html: String
        public let download: String
        public let downloadLocation = "download_location"

        enum CodingKeys: String, CodingKey {

            case origin = "self"
            case html
            case download
            case downloadLocation = "download_location"

        }

    }

    public struct PhotoURL: Codable {

        /// Raw Image - maybe slow to load
        public let raw: String

        /// Full Image - maybe slow to load
        public let full: String

        /// Width of 1080px
        public let regular: String

        /// Width of 400px
        public let small: String

        /// Width of 200px
        public let thumbnail: String

        enum CodingKeys: String, CodingKey {

            case raw, full, regular, small
            case thumbnail = "thumb"

        }

    }

    public struct ExifModel: Codable {

        public let maker: String
        public let model: String
        public let exposureTime: String
        public let aperture: String
        public let focalLength: String
        public let iso: Int

        enum CodingKeys: String, CodingKey {

            case maker = "make"
            case model
            case exposureTime = "exposure_time"
            case aperture
            case focalLength = "focal_length"
            case iso

        }

    }

    public struct LocationModel: Codable {

        public let title: String?
        public let name: String?
        public let city: String?
        public let country: String?
        public let position: PositionModel?

        public struct PositionModel: Codable {

            public let latitude: Double?
            public let longitude: Double?

        }

    }

}
