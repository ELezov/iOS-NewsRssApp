import Foundation
import FeedKit

class NewsManager{
    
    func getNews(_ completion:@escaping ([RSSFeedItem]?) -> Void) {
        let feedUrl = URL(string: "https://tjournal.ru/rss/all" /*"https://habrahabr.ru/rss/interesting/"*//*"https://vc.ru/rss/all"*/)
        
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
    
    func getNewsFromVC(_ completion:@escaping ([News]?) -> Void){
        getNews(endpoint: NewsVCEndpoint.getNews,completion)
    }
    
    func getNewsFromTJ(_ completion:@escaping ([News]?) -> Void){
        getNews(endpoint: NewsTJEndpoint, completion)
    }
    
    func getNews(endpoint: Endpoint,_ compltetion:@escaping ([News]?) -> Void){
        let request = Network.shared.request(endpoint: endpoint) { response in
            if response.result.isSuccess {
                var newsArray = [News]()
                let itemsArrayRSS = response.result.value?.items
                // TODO: Существует ли более элегантный способ?
                for item in itemsArrayRSS!{
                    let news = News(title: item.title!, description: item.description)
                    newsArray.append(news)
                }
                compltetion(newsArray)
            } else {
                // Handle error
            }
        }

    }
    
}
