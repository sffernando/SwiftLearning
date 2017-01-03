//
//  Request.swift
//  POPProgrammingTry
//
//  Created by fernando on 2017/1/3.
//  Copyright © 2017年 fernando. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var host: String { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response
    func parser(data: Data) -> Response?
}

struct UserRequest: Request {
    let name: String
    
    let host = "https://api.onevcat.com"
    var path: String {
        return "/users/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String : Any] = [:]
    
    typealias Response = User
    
    func parser(data: Data) -> User? {
        return User(data: data)
    }
}


extension Request {
    func send(handler: @escaping (Response?) -> Void) {
        let url = URL(string: host.appending(path))!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            if let data = data, let res = self.parser(data: data) {
                DispatchQueue.main.async {
                    handler(res)
                }
            } else {
                DispatchQueue.main.async {
                    handler(nil)
                }
            }
        }
        task.resume()
    }
}
