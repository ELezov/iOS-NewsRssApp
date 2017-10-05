import Foundation

class News {
    var title: String!
    var description: String!
    
    required init(title: String, description: String){
        self.title = title
        self.description = description
    }
}
