import Foundation
import FeedKit

class NewsManager{
    
    func getNews(_ completion:@escaping ([RSSFeedItem]?) -> Void) {
        let feedUrl = URL(string:  "https://vc.ru/rss/all")
        
        let parser = FeedParser(URL: feedUrl!)
        
        var feed: RSSFeed?
        print("Request Begin!")
        parser?.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            feed = result.rssFeed
            DispatchQueue.main.async {
                    print("rss")
                    print("rss",feed?.items?.count)
                    completion(feed?.items)
            }
        }
    }
    
}
