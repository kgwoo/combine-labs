//
//  ProductView.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/15.
//

import SwiftUI

struct ProductView: View {
    @StateObject var vm = ProductViewModel.shared
    
    var body: some View {
        VStack{
            HStack{
                HStack{}.frame(width:24,height:24)
                Spacer()
                Text("Product")
                    .font(.system(size: 18))
                Spacer()
                HStack(spacing:8){
                    Button(action:{
                        vm.appendProduct()
                    }){
                        Image(systemName: "plus")
                            .frame(width:24, height:24)
                    }
                    Button(action:{}){
                        Image(systemName: "line.horizontal.3")
                            .frame(width:24, height:24)
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(height:50)
            VStack{
                ForEach(vm.products, id: \.id){ product in
                    HStack{
                        Text("ID: \(product.id)")
                    }
                    .frame(height: 48)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear{
            vm.test()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
