//
//  SequncePublisher.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 10/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

//
//  PublisherCombine.swift
//  GraphicsSwiftUI
//
//  Created by Ramesh kumar penta on 16/10/20.
//

import Foundation
import  Combine

extension Publishers
{
    struct  NumberSequencePublisher : Publisher
{
    typealias Output = Int
    
    typealias Failure = Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        
        let numberSequunceSubscription = NumberSequenceSubscripton(subscriber: subscriber)
        
        subscriber.receive(subscription: numberSequunceSubscription)
        
    }
  
    }
    class NumberSequenceSubscripton<S: Subscriber> : Subscription where S.Input == Int , S.Failure == Never
    {
         var subscriber : S?
        var demand : Subscribers.Demand = .unlimited
        
        init(subscriber : S ) {
            self.subscriber = subscriber
        }

    func request(_ demand: Subscribers.Demand) {
        print("subscription request called \(demand.description)")
        self.demand = demand
        emitSequence()
       }

    func emitSequence()
    {
            let values  = [2,3,4]
        for (index, element) in values.enumerated() {
         // print("Item \(index): \(element)")

            sleep(1)
            if demand == .unlimited || demand.max! == 0
            {
                self.demand =  self.subscriber?.receive(element) ?? Subscribers.Demand.unlimited

            }
            if demand != .unlimited && demand != .none && index <= (demand.max!-1)
            {
                self.demand =  self.subscriber?.receive(element) ?? Subscribers.Demand.none

            }

            
        }
           
        self.subscriber?.receive(completion: .finished)
                

    }
        
   
    func cancel() {
        subscriber = nil
    }
    }
    
   
}


class NumberSequenceSubscriber : Subscriber
{
   
    func receive(subscription: Subscription) {
        print("subscribed \(subscription.combineIdentifier)")
        subscription.request(Subscribers.Demand.max(3))
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
        print("subscriber recieve value \(input)" )
      return  Subscribers.Demand.unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print(completion.self)
    }
    
    typealias Input = Int
    
    typealias Failure = Never
    
    
}



