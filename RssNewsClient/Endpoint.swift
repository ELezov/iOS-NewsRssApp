import Foundation
import Alamofire

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var fullURL: String { get }
    var method: HTTPMethod {get }
    var encoding : ParameterEncoding { get }
    var body: Parameters { get }
    var headers: HTTPHeaders { get }
}

extension Endpoint {
    
    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
    
    var fullUrl: String{
        return baseURL + path
    }
    
    var body: Parameters{
        return Parameters()
    }
}
