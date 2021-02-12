//
//  MappingElements.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine
struct  SequenceError : Error {
    public var errorMessage = "containsOddNumber"

    
}



func mapUsecase() -> Publishers.Map< Publishers.NumberSequencePublisher, Publishers.NumberSequencePublisher.Output>
{
    return Publishers.NumberSequencePublisher().map { $0 + 100
    }
}

func tryMapUseCase() -> Publishers.TryMap<Publishers.NumberSequencePublisher,Publishers.NumberSequencePublisher.Output>
{
    return Publishers.NumberSequencePublisher().tryMap { (value)  in
        if value % 2 != 0
        {
            throw SequenceError()
           
        }
        else
        {
        return value
        }
    }
   
}

func replaceNilUsecase() -> Publishers.Map<Publishers.Sequence< [String?], Never>,String>
{
    return ["java","kotlin","swfit",nil].publisher.replaceNil(with: "Java")
}

func scanUsecase() -> Publishers.Scan<Publishers.NumberSequencePublisher, Publishers.NumberSequencePublisher.Output>
{
    return Publishers.NumberSequencePublisher().scan(0) { (sum, current) -> Int in
        return sum  + current
    }
}

func tryscanUsecase() -> Publishers.TryScan<Publishers.NumberSequencePublisher, Publishers.NumberSequencePublisher.Output>
{
    return Publishers.NumberSequencePublisher().tryScan(0) { (sum, current) -> Int in
        if current % 2 != 0
        {
            throw SequenceError()
        }
        else
        {
        return sum  + current
        }
    }
}   
func compactMapUsecase() -> Publishers.CompactMap<Publishers.Sequence< [String?], Never>,String>
{
    return ["java","kotlin","swfit",nil].publisher.compactMap { (value) in
        return value
    }
}

func removeDuplicates() -> Publishers.RemoveDuplicates<Publishers.Sequence< [String?], Never>>
{
    return ["java","java","kotlin","swfit"].publisher.removeDuplicates()
}
struct languageError : Error{}
func tryRemoveDuplicates() -> Publishers.TryRemoveDuplicates<Publishers.Sequence< [String?], Never>>
{
    return ["java","java","kotlin","swfit"].publisher.tryRemoveDuplicates { (prev, current) -> Bool in
        if prev == "kotlin"
        {
            throw languageError()
        }
        else
        {
            return prev == current
        }
    }
    
}

func replaceEmptyStream() -> Publishers.ReplaceEmpty<Publishers.Sequence<[String],Never>>
{
    return [].publisher.replaceEmpty(with: "Java")
}

func collect() -> Publishers.Collect<Publishers.NumberSequencePublisher>
{
  return  Publishers.NumberSequencePublisher().collect()
}

func reduce() -> Publishers.Reduce<Publishers.NumberSequencePublisher,Int>
{
    return Publishers.NumberSequencePublisher().reduce(0) { $0 + $1
    }
}

