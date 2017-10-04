import Foundation
import FeedKit

class DetailNewsViewModel{
    var title : String!
    var description: String!
    
    required init(rssFeedItem: RSSFeedItem){
        self.title = rssFeedItem.title
        self.description = rssFeedItem.description
    }
}
