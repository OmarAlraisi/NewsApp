//
//  ViewController.swift
//  News App
//
//  Created by Omar Al Raisi on 10/5/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelProtocol {
    
    // Link the table view
    @IBOutlet weak var tableView: UITableView!
    
    // Create necessary variables
    var feed = [Article]()
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set DataSource and Delegate of tableView to self(ViewController)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set the protocle of the Model to the view controller
        model.delegate = self
        
        // Get the news feed
        model.getNewsFeed()
       
    }

    // MARK: - Article ViewController method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Check a cell is selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get the cell selected
        let articleSellected = feed[tableView.indexPathForSelectedRow!.row]
        
        // Create an object of type ArticleViewController
        let articleVC = segue.destination as! ArticleViewController
        
        // Pass the sellected article to the article view controller
        articleVC.article = articleSellected
    }
    
    // MARK: - Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of articles found
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create an ARTICLECELL
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.NEWS_ID, for: indexPath) as! ArticleTableViewCell
        
        // Get an article
        let article = self.feed[indexPath.row]
        
        // Configure it
        cell.setArticleCell(article)
        
        // Return it
        return cell
    }
    
    // MARK: - Fetching Articles
    func fetchArticles(_ articles: [Article]) {
        
        // Set feed
        self.feed = articles
        
        // Reload Table
        tableView.reloadData()
    }
}
