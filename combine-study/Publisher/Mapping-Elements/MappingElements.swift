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
    
    @Published var tickets:[Ticket] = []
    
    func map(){
        cancellable = ResponseResults.Friends.publisher
            .map { user in
                let ticket = Ticket(name: user.name, age: user.age, type: "자유이용권")
                return ticket
            }
            .sink {[weak self] ticket in
                print("환영합니다. \(ticket.name)님, 나이:\(ticket.age)")
                self?.tickets.append(ticket)
            }
    }
    
    
    func tryMap(){
        cancellable = tickets.publisher
            .tryMap { try self.validateTicket(ticket: $0) }
            .sink(
                receiveCompletion: { print ("completion: \($0)") },
                receiveValue: { print ("[\($0.name)]님은 입장가능하십니다.") }
             )
    }
    
    
    private func validateTicket(ticket:Ticket) throws -> Ticket {
        guard ticket.age > 25 else {
            throw RejectError()
        }
        
        return ticket
    }
}

struct RejectError: Error {}
