import Foundation
import FeedKit

class NewsManager{
    
    func getNews(_ completion:@escaping ([RSSFeedItem]?, String?) -> Void) {
        let feedUrl = URL(string:  "https://vc.ru/rss/all")
        
        let parser = FeedParser(URL: feedUrl!)
        parser?.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            DispatchQueue.main.async {
                switch result{
                case let .rss(feed): print("rss")
                //self.shownNews = feed.items!
                //print(self.shownNews.count)
                //self.tableView.reloadData()
                completion(feed.items, nil)
                    //case let .json(feed): print("json")
                //case let .failure(error): print("error")
                default:
                    print("fatal error")
                    completion(nil,result.error?.description)
                }
            }
        }
    }
    
}
