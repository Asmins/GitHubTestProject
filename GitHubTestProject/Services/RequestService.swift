
import UIKit
import Foundation
import Alamofire

protocol RequestServiceProtocol {
    func sendRequest(_ stringURL: String, method:HTTPMethod, parameters: [String:Any], headers: [String: String], result:@escaping (_ data:Data?, _ error: Error?) -> Void)
}

class RequestService {
    fileprivate let url = "https://api.github.com/"
    private static var instance: RequestService?

    private init() {}

    static let sharedInstance: RequestService = {
        if instance == nil {
            instance = RequestService()
        }
        return instance!
    }()

    func getRepositoriesListFor(_ userName: String, parameters: [String:Any], headers: [String: String],result:@escaping (_ data:Data?, _ error: Error?) -> Void) {
        self.sendRequest(self.url + "users/\(userName)/repos",method: .get, parameters: parameters,headers: headers,result: result)
    }

    func getListIssues(_ repositoryName: String, parameters: [String: Any], headers: [String: String], result:@escaping (_ data:Data?, _ error: Error?) -> Void) {
        let userName = UserDefaults.standard.value(forKey: "userName") as! String
        self.sendRequest(self.url + "repos/\(userName)/\(repositoryName)/issues", method: .get, parameters: parameters, headers: headers, result: result)
    }
}

extension RequestService: RequestServiceProtocol {
    func sendRequest(_ stringURL: String, method: HTTPMethod, parameters: [String : Any], headers: [String : String], result: @escaping (Data?, Error?) -> Void) {
        Alamofire.request(stringURL, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                return result(response.data, nil)
            case .failure(let error):
                print(error)
                return result(nil, error)
            }
        })
    }
}
