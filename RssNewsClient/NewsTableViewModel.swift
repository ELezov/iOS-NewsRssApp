import Foundation
import FeedKit

class NewsTableViewModel{
    //weak var newsManager: N
    fileprivate var cellsArray = [NewsTableCellViewModel]()
    fileprivate var newsArray: [RSSFeedItem]!
    var error: String?
    
    func updateDate(_ completion:@escaping () -> Void){
        cellsArray.removeAll()
    }
    
    func numberOfNews() -> Int {
        return cellsArray.count
    }
    
    func cellViewModel(_ index: Int) -> NewsTableCellViewModel {
        guard index < cellsArray.count else {
            return nil
        }
        return cellsArray[index]
    }
    
    required init(){
        
    }
}
