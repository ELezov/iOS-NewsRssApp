import Foundation

class NewsManager{
    
    func getNewsFromVC(_ completion:@escaping ([News]?) -> Void){
        getNews(endpoint: NewsVCEndpoint.getNews,completion)
    }
    
    func getNewsFromTJ(_ completion:@escaping ([News]?) -> Void){
        getNews(endpoint: NewsTJEndpoint.getNews, completion)
    }
    
    func getNews(endpoint: Endpoint,_ compltetion:@escaping ([News]?) -> Void){
        let request = Network.shared.request(endpoint: endpoint) { response in
            if response.result.isSuccess {
                var newsArray = [News]()
                let itemsArrayRSS = response.result.value?.items
                // TODO: Существует ли более элегантный способ?
                for item in itemsArrayRSS!{
                    let news = News(title: item.title!, description: item.itemDescription!, date: item.pubDate!, url: URL(string: item.link!)!)
                    newsArray.append(news)
                }
                compltetion(newsArray)
            } else {
                // Handle error
            }
        }

    }
    
    
    
}
