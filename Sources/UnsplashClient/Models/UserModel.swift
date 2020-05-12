//
//  UserModel.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import Foundation


public struct UserModel: Codable {

    public let id: String
    public let lastUpdateDate: String?

    public let username: String
    public let name: String
    public let firstname: String
    public let lastname: String?
    public let twitterName: String?
    public let portfolioURL: String?
    public let biography: String?
    public let instagramUsername: String?

    public let links: [UserModel.LinkKey.RawValue: String] = [:]
    public let profileImageLinks: [UserModel.ProfileImageKey.RawValue: String] = [:]

}


extension UserModel {

    public enum ProfileImageKey: String {

        case small, medium, large

    }

    enum CodingKeys: String, CodingKey {

        case id
        case lastUpdateDate = "updated_at"
        case username
        case name
        case firstname = "first_name"
        case lastname = "last_name"
        case twitterName = "twitter_username"
        case portfolioURL = "portfolio_url"
        case biography = "bio"
        case instagramUsername = "instagram_username"
        case links
        case profileImageLinks = "profile_image"

    }

    public enum LinkKey: String {

        case `self`
        case html
        case photos
        case likes
        case portfolio
        case following
        case followers

    }

}
