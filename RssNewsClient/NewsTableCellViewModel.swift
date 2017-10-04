import Foundation
import FeedKit

class NewsTableCellViewModel{
    var titleLabel : String!
    
    required init(rssItemFeed: RSSFeedItem){
        self.titleLabel = rssItemFeed.title
    }
}
