import Foundation
import FeedKit

class NewsTableCellViewModel{
    var titleLabel : String!
    var timeLabel : String!
    
    required init(rssItemFeed: RSSFeedItem){
        self.titleLabel = rssItemFeed.title
    }
}
