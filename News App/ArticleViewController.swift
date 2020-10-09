//
//  ArticleViewController.swift
//  News App
//
//  Created by Omar Al Raisi on 10/6/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    // Link UI elements
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var publicationLabel: UILabel!
    @IBOutlet weak var webPage: WKWebView!
    
    // Create a variable to hold the passed article
    var article:Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Reset labels
        articleTitleLabel.text = ""
        publicationLabel.text = ""
        
        // Call setView
        setView()
        
        // Do any additional setup after loading the view.
    }
    
    // Set view
    func setView () {
        
        // Check if there's an article
        guard article != nil else {
            return
        }
        
        // Set title
        if article!.title != nil {
            articleTitleLabel.text = "  " + article!.title!
        }
        
        // Set date
        if article!.publishedAt != nil {
            publicationLabel.text = "  " + article!.publishedAt!
        }
        
        // Set the webPage
        guard article!.url != nil else {
            return
        }
        
        // Create a url
        // Make the url accept non-English characters
        let urlString = (article?.url!)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        // Create it
        let url = URL(string: urlString!)
                
        // Create a request
        let request = URLRequest(url: url!)
        
        // Load the request in the web page
        webPage.load(request)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
