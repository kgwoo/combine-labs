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
        VStack {
            Text("Hello, Combine!")
        }
        .padding()
        .onAppear{
            MappingElements.map()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
