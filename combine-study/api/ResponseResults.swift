//
//  GetUsers.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/13.
//

import Foundation

struct ResponseResults{
    static let Friends:[User] = [
        User(name: "Stellar", age: 26),
        User(name: "Luna", age: 26),
        User(name: "Phoenix", age: 26),
        User(name: "Aurora", age: 26),
        User(name: "Cascade", age: 25)
    ]
    
    static let products:[Product] = {
        var results = [
            Product(id: 0, name:"상품1"),
            Product(id: 1, name:"상품2"),
            Product(id: 2, name:"상품3"),
            Product(id: 3)
        ]
        return results
    }()
}
