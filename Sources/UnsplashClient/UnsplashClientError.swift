//
//  UnsplashClientError.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import Foundation


public enum UnsplashClientError: Error {

    case failedToReadBody
    case requestFailed
    case invalidRequest
    case modelDecodingError(Error)

}
