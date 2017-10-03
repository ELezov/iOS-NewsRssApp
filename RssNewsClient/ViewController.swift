//
//  ViewController.swift
//  RssNewsClient
//
//  Created by Nikolay on 03.10.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import UIKit
import FeedKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let feedUrl = URL(string:  "https://vc.ru/rss/all")
        
        let parser = FeedParser(URL: feedUrl!)
        parser?.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            DispatchQueue.main.async {
                switch result{
                    case let .rss(feed): print("rss")
                    case let .json(feed): print("json")
                    case let .failure(error): print("error")
                    default:
                          print("fatal error")
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

