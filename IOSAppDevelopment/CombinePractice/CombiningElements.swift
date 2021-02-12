//
//  CombiningElements.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine


func comibineLatest<Publisher1: CurrentValueSubject<Bool, Never>,Publisher2: CurrentValueSubject<Bool,Never>>(publisher1 : Publisher1, publisher2 : Publisher2) -> Publishers.Map<Publishers.CombineLatest<Publisher1, Publisher2>, Bool> {
    
    return publisher1.combineLatest(publisher2) { (first, second) in
        return first && second
    }
}

func merge() -> Publishers.MergeMany<Publishers.Sequence<[Int],Never>>
{
   return [1,3,5].publisher.merge(with: [1,1,2,4].publisher)
}
func zip() -> Publishers.Zip<Publishers.Sequence<[Int],Never>,Publishers.Sequence<[Int],Never>>
{
    return [1,3,5].publisher.zip([1,2,4].publisher)
}


func zipMap() -> Publishers.Map<Publishers.Zip<Publishers.Sequence<[Int],Never>, Publishers.Sequence<[Int],Never>>, Int> {
  
    return [1,3,5,6].publisher.zip([7,8,9,10].publisher) { $0 + $1
    }
}

