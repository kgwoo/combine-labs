//
//  ApplyingSequenceOperationsToElements.swift
//  combine-study
//
//  Created by GunWoo on 2023/06/15.
//

import Foundation
import Combine

final class ApplyingSequenceOperationsToElements{
    private var cancellable: AnyCancellable?
        
    func append<T>(arr: [T], ele: T, completion: @escaping (_ results: [T]) -> Void) {
        let arrPublisher = Publishers.Sequence<[T], Never>(sequence: arr)
     
        cancellable = arrPublisher
            .append([ele])
            .collect()
            .sink { results in
                print("실행되는중")
                completion(results)
            }
    }
    
    func PubSub(){
        // 발행자(Publisher) - "숫자[Int]" 주제
        let numbersPublisher = [1, 2, 3, 4, 5].publisher
        

        // 구독자1(Subscriber)
        let subscriber_1 = Subscribers.Sink<Int, Never>(
            receiveCompletion: { completion in
                   print("subscriber_1 Received completion\n")
            },
            receiveValue: { value in
                print("Received value:", value)
            }
        )
        
        // 구독자2(Subscriber)
        let subscriber_2 = Subscribers.Sink<Int, Never>(
            receiveCompletion: { completion in
                   print("subscriber_2 Received completion:", completion)
            },
            receiveValue: { value in
                print("Received value:", value + 5)
            }
        )

        // 구독자가 발행자의 숫자(Int) 주제(Subject)를 구독
        // 주제가 발행될 시 구독자에게 데이터 전달
        numbersPublisher.subscribe(subscriber_1)
        
        numbersPublisher.subscribe(subscriber_2)
    }
}
