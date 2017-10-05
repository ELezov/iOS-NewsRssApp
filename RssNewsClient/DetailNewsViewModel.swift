import Foundation

class DetailNewsViewModel{
    var title : String!
    var description: String!
    
    required init(news: News){
        self.title = news.title
        self.description = news.description
    }
}
