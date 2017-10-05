import Foundation
import Alamofire

enum NewsVCEndpoint{
    case getNews
}

enum NewsTJEndpoint{
    case getNews
}

extension NewsVCEndpoint: Endpoint{
    internal var headers: HTTPHeaders {
        return ["Authorization" : ""]
    }

    
    var fullURL: String {
        return baseURL + path
    }
    
    var baseURL: String {
        switch self {
        case .getNews: return "https://vc.ru/"
        }
    }


    var path: String{
        switch  self {
        case .getNews: return "rss/all"
        }
    }
    
    var method: HTTPMethod{
        switch self {
           case .getNews: return .get
        }
    }
}

extension NewsTJEndpoint: Endpoint{
    internal var headers: HTTPHeaders {
        return ["Authorizaton" : ""]
    }

    internal var fullURL: String {
        return baseURL + path
    }

    var method: HTTPMethod{
        switch self{
            case .getNews: return .get
        }
    }
    
    var baseURL: String{
        switch self{
            case .getNews: return "https://tjournal.ru/"
        }
    }
    
    var path: String{
        switch self{
            case.getNews: return "/rss/all"
        }
    }
}


