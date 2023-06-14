//
//  FilteringElements.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/14.
//

import Foundation
import Combine

final class FilteringElements:ObservableObject{
    static let shared = FilteringElements()
    private var cancellable: AnyCancellable?
    @Published var products: [Product] = ResponseResults.products
    
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
