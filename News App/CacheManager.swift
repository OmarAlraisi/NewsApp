//
//  CacheManager.swift
//  News App
//
//  Created by Omar Al Raisi on 10/6/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

class CacheManager {
    
    // Create a dictionary to hold all urlToImage as keys, and all image data as values to the keys
    static var cache = [String:Data]()
    
    // To store the image
    static func setCache (_ url:String, _ data:Data) {
        
        // Add the image data with the url as a key
        cache[url] = data
    }
    
    // To give the image back
    static func getCache (_ url:String) -> Data? {
        
        // If such key exist, return the image value of it
        return cache[url]
    }
}
