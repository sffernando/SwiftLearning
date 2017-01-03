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
    
    associatedtype Response: Decodable
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

protocol Client {
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)
    
    var host: String { get }
}

struct URLSessionClient: Client {
    let host = "https://api.onevcat.com"
    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))
        var request = URLRequest(url: url!)
        request.httpMethod = r.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let data = data, let res = T.Response.parser(data: data) {
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

protocol Decodable {
    static func parser(data: Data) -> Self?
}
