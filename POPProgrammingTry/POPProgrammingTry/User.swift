//
//  User.swift
//  POPProgrammingTry
//
//  Created by fernando on 2017/1/3.
//  Copyright © 2017年 fernando. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        guard let name = obj?["name"] as? String else {
            return nil
        }
        guard let message = obj?["message"] as? String else {
            return nil
        }
        
        self.name = name
        self.message = message
    }
}

extension User: Decodable {
    static func parser(data: Data) -> User? {
        return User(data: data)
    }
}
