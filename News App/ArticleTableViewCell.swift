//
//  ArticleTableViewCell.swift
//  News App
//
//  Created by Omar Al Raisi on 10/5/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    // Link UI elements
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // Create an article to hold the passed article
    var article:Article?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setArticleCell (_ ar:Article) {
        
        self.article = ar
        
        // Check if there's a video
        guard self.article != nil else {
            return
        }
        
        // Set titleLabel
        // If there's no title in the article
        if self.article?.title == nil {
            self.titleLabel.text = "  Title is not available!"
        }
        else {
            self.titleLabel.text = "  " + self.article!.title!
        }
        
        // Set dateLabel
        // If there's no date in the article
        if self.article?.publishedAt == nil {
            self.dateLabel.text = "  Date is not available!"
        }
        else {
            self.dateLabel.text = "  " + self.article!.publishedAt!
        }
        
        // Set articleImageView
        // Check urlToImage exist
        if self.article!.urlToImage != nil {
            
            // Check if the picture already downloaded
            let articleImage = CacheManager.getCache(self.article!.urlToImage!)
            if articleImage != nil {
                
                // Set it to be the image instead of downloading again
                self.articleImageView.image = UIImage(data: articleImage!)
                return
            }
        
            // Create a URL
            let url = URL(string: self.article!.urlToImage!)
            
            // Create a URLSession
            let session = URLSession.shared
            
            // Create task
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                // Check for errors
                guard error == nil && data != nil else {
                    return
                }
                
                // Add the image to the cache
                CacheManager.setCache(url!.absoluteString, data!)
                
                // Display the image without inturrupting the program
                DispatchQueue.main.async {
                    
                    self.articleImageView.image = UIImage(data: data!)
                }
            }
            
            // Resume task
            dataTask.resume()
        }
        
        // If article has no image
        else {
            
            // Set a default image to it
            self.articleImageView.image = UIImage(named: "GridBorder")
        }
    }
}
