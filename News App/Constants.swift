//
//  Constants.swift
//  News App
//
//  Created by Omar Al Raisi on 10/5/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Constant {
    
    static var API_KEY = "Change Here" // Change the key to your own
    static var ENDPOINT = "headlines"
    static var API_URL = "http://newsapi.org/v2/top-\(Constant.ENDPOINT)?country=eg&apiKey=\(Constant.API_KEY)"
    
    static var NEWS_ID = "NewsCell"
}
