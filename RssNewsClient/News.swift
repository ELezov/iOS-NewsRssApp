import Foundation

class News {
    var title: String!
    var description: String!
    var date: Date!
    var url: URL!
    
    required init(title: String, description: String, date: Date, url: URL){
        self.title = title
        self.description = description
        self.date = date
        self.url = url
    }
}
