//
//  FilteringElements.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/14.
//

import Foundation
import Combine

final class FilteringElements{
    private var cancellable: AnyCancellable?
    var products: [Product]
    let numbers = [0, 1, 2, 2, 3, 3, 3]
    
    init(products:[Product]){
        self.products = products
    }
    
    func test(){
        cancellable = numbers.publisher
            .removeDuplicates(by: { prev, current in
                print(prev, current)
               return prev == current
            })
            .sink{ num in
                print("숫자: \(num)")
            }
    }
        
    func removeDuplicates(){
        cancellable = products.publisher
            .removeDuplicates()
            .collect()
            .sink{ [weak self] newProducts in
                self?.products = newProducts
            }
    }
    
    func removeDuplicatesBy(){
        cancellable = products.publisher
            .removeDuplicates(by: { prev, current in
                print("이전 값",prev.id)
                print("현재 값", current.id)
                return prev.id == current.id
            })
            .sink { p in
                print("결과 값>>",p)
            }
    }
}


struct Point {
    let id: Int
    let y: Int
}
