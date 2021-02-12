//
//  FuturePublisher.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 09/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine

class FutureCombinePractice
{
    func test()
    {
        enum Gender
        {
            case Male(Int)
            case Female(String)
        }
        
        func test1(gender : Gender)
        {
            switch gender {
            case .Male(let number):
                print(number)
            case .Female(let str) :
                print(str)
            default :
                print("default")
            }
        }
        
        test1(gender : Gender.Male(1))

        @frozen  enum Some<Success,Q> : Error
        {
            case Male(Success)
            case Female(Q)
            
        }
        func testGenericEnum(some : Some<Int,Int>)
        {
            switch some {
            case .Male(let value):
                print("male")
                
            case .Female(let value):
                print(value)
            }
        }
        
       
     @frozen enum TestResult<T>
        {
            init(string : () -> String )
            {
                self.init()
            }
        
        init() {
            self = .Male(T.self as! T)
        }
            
            case Male(T)
        }
        _ = TestResult<String> { "tset"}
        
        
    }
    
    
}

func performAsyncActionAsFuture() -> Future <Void, Never> {
    return Future() { promise in
        DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
            promise(Result.success(()))
        }
    }
}

func performAsyncActionAsFutureWithParameter() -> Future <Int, Never> {
    return Future() { promise in
        DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
            let rn = Int.random(in: 1...10)
            promise(Result.success(rn))
        }
    }
}
