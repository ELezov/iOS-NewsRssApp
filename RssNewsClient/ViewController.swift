//
//  ViewController.swift
//  RssNewsClient
//
//  Created by Nikolay on 03.10.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import UIKit
import FeedKit


class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var shownNews = [RSSFeedItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        let feedUrl = URL(string:  "https://vc.ru/rss/all")
        
        let parser = FeedParser(URL: feedUrl!)
        parser?.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            DispatchQueue.main.async {
                switch result{
                    case let .rss(feed): print("rss")
                                         self.shownNews = feed.items!
                                         print(self.shownNews.count)
                                         self.tableView.reloadData()
                    
                    //case let .json(feed): print("json")
                    //case let .failure(error): print("error")
                    default:
                          print("fatal error")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        cell.textLabel?.text = shownNews[indexPath.row].title
        print(shownNews[indexPath.row].title)
        
        return cell
    }


}

