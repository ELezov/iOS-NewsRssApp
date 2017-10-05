import Foundation

class NewsTableCellViewModel{
    var titleLabel : String!
    
    required init(news: News){
        self.titleLabel = news.title
    }
}
