import Foundation
import FeedKit

class NewsTableViewModel{
    weak var newsManager: NewsManager!
    fileprivate var cellsArray = [NewsTableCellViewModel]()
    fileprivate var newsArray: [RSSFeedItem]!
    var detailsViewModel: DetailNewsViewModel!
    var error: String?
    
    func updateDate(_ completion:@escaping () -> Void){
        cellsArray.removeAll()
        newsManager.getNews{ (newsArray) -> Void in
            self.newsArray = newsArray
            for news in newsArray!{
                self.cellsArray.append(NewsTableCellViewModel(rssItemFeed: news))
            }
            completion()
        }
    }
    
    func numberOfNews() -> Int {
        return cellsArray.count
    }
    
    func cellViewModel(_ index: Int) -> NewsTableCellViewModel? {
        guard index < cellsArray.count else { return nil }
        return cellsArray[index]
    }
    
    func getDetailsViewModel(_ index:Int) -> DetailNewsViewModel {
        self.detailsViewModel = DetailNewsViewModel(rssFeedItem: newsArray[index])
        return self.detailsViewModel
    }
    
    required init(newsManager: NewsManager){
        self.newsManager = newsManager
    }
}
