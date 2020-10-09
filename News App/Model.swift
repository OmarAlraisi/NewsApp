//
//  Model.swift
//  News App
//
//  Created by Omar Al Raisi on 10/5/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

// Create a protocol so we can use this class in the ViewController class
protocol ModelProtocol {
    
    // This function belongs to this class but is used in the ViewController
    func fetchArticles(_ articles: [Article])
}

class Model {
    
    // Create a delegate variable to the protocol so it can be set in the ViewController
    var delegate:ModelProtocol?
    
    // Create a method to generate the news feed
    func getNewsFeed () {
        
        // Create URL
        let url = URL(string: Constant.API_URL)
        
        // Check if url is empty
        guard url != nil else {
            return
        }
        
        // Start URLSssion
        let session = URLSession.shared
        
        // Create a task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there are errors or no data
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parse the entire JSON
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data!)
                
                // Check if respone is not empty
                if response.articles != nil {
                    
                    // Fetch the entire response without sinturrupting the rest of the program
                    DispatchQueue.main.async {
                        
                        self.delegate?.fetchArticles(response.articles!)
                    }
                }
            }
            catch {
                return
            }
        }
        
        // Resume task
        dataTask.resume()
    }
}
