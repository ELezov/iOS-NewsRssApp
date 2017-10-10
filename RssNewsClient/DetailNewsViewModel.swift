import Foundation

class DetailNewsViewModel{
    var title : String!
    var description: String!
    var url: URL!
    
    required init(news: News){
        self.title = news.title
        self.description = news.description
        self.url = news.url
    }
}
