//
//  ContentView.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var FilteringMethod = FilteringElements.shared
    
    var body: some View {
        VStack(spacing:20){
            Text("Hello, Combine!")
            Button(action:{ FilteringMethod.removeDuplicates()}){
                Text("상품 중복 제거")
            }
            
            VStack(spacing:8){
                ForEach(FilteringMethod.products, id:\.id) { product in
                    Text("상품 아이디: \(product.id)")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
