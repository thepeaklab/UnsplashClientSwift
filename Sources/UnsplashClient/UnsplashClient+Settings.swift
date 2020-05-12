//
//  UnsplashClient+Settings.swift
//  UnsplashClientSwift
//
//  Created by Sandro Wehrhahn on 12.05.20.
//  Copyright © 2020 the peak lab. gmbh & co. kg. All rights reserved.
//


import Foundation


public extension UnsplashClient {

    enum ColorFilter: String {

        case blackAndWhite = "black_and_white"
        case black
        case white
        case yellow
        case orange
        case red
        case purple
        case magenta
        case green
        case teal
        case blue

    }

    enum PhotoOrder: String{

        case relevant
        case latest

    }

    enum PhotoOrientation: String {

        case portrait
        case squarish
        case landscape

    }

}
