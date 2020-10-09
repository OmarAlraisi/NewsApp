//
//  Response.swift
//  News App
//
//  Created by Omar Al Raisi on 10/5/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var articles:[Article]?
    
    enum CodingKeys: String, CodingKey {
        case articles
    }
    
    init(from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Parse articles
        self.articles = try container.decode([Article].self, forKey: .articles)
    }
}
