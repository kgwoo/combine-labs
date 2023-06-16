//
//  ProductViewModel.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/15.
//

import Foundation

final class ProductViewModel:ObservableObject{
    static let shared = ProductViewModel()
    let applySequenceOperator = ApplyingSequenceOperationsToElements()
    @Published var products:[Product] = []
    
    
    func appendProduct(){
        var newProduct:Product
        
        if let lastProduct = products.last{
            newProduct = Product(id: lastProduct.id + 1)
        }else{
            newProduct = Product(id: 0)
        }
        
        applySequenceOperator.append(arr: products, ele: newProduct) { [weak self] results in
            self?.products = results
        }
    }
}
