import Foundation

class NewsTableCellViewModel{
    var titleLabel : String!
    var pubDateLabel : String!
    
    required init(news: News){
        self.titleLabel = news.title
        self.pubDateLabel = dateToString(news.date)
    }
}
