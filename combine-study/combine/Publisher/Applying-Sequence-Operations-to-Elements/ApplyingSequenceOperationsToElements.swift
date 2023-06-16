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
                completion(results)
            }
    }
}
