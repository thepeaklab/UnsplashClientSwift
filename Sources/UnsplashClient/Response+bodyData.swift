//
//  Response+bodyData.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import Foundation
import NIO
import AsyncHTTPClient


public extension HTTPClient.Response {

    var bodyData: Data? {
        guard var body = body, let bytes = body.readBytes(length: body.readableBytes) else { return nil }
        return Data(bytes)
    }

}
