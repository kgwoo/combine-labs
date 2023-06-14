//
//  ContentView.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var MappingElements = MappingElement.shared
    
    var body: some View {
        VStack(spacing:20){
            Text("Hello, Combine!")
            Button(action:{ MappingElements.map()}){
                Text("티켓 발행")
            }
            Button(action:{ MappingElements.tryMap()}){
                Text("티켓검사")
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
