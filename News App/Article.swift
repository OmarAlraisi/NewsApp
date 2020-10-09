//
//  Article.swift
//  News App
//
//  Created by Omar Al Raisi on 10/5/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Article : Decodable {
    
    var title:String?
    var publishedAt:String?
    var urlToImage:String?
    var url:String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case urlToImage
        case publishedAt
    }
    
    init (from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Parse title
        self.title = try container.decode(String.self, forKey: .title)
        
        // Parse url
        self.url = try container.decode(String.self, forKey: .url)
        
        // Parse urlToImage
        self.urlToImage = try container.decode(String.self, forKey: .urlToImage)
        
        // Parse publishedAt
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
    }
    
}
