//
//  MappingElements.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/13.
//

import Foundation
import Combine

final class MappingElement:ObservableObject{
    static let shared = MappingElement()
    private var cancellable: AnyCancellable?
    private let numbers =  [5,4,3,2,1,0]
    private let romanNumeralDict:[Int:String] = [1:"I", 2:"II", 3:"III", 4:"IV", 5:"V"]
    private let users:[String] = ["a", "b", "c", "d", "e"]
    
    func map(){
        cancellable = users.publisher
            .map { "\($0) 님, 환영합니다." }
            .sink { print("\($0)") }
    }
    
    func tryMap(){
        cancellable = numbers.publisher
            .tryMap { try self.romanNumeral(from: $0) }
            .sink(
                receiveCompletion: { print ("completion: \($0)") },
                receiveValue: { print ("\($0)") }
             )
    }
    
    
    private func romanNumeral(from:Int) throws -> String {
        guard let numeral = romanNumeralDict[from] else {
            throw ParseError()
        }
        return numeral
    }
}

struct ParseError: Error {}
