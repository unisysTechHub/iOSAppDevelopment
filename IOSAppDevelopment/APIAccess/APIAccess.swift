//
//  APIAccess.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 26/11/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine
func startLoad() {
    let url = URL(string: "https://loan-on-property-applcation-bucket.s3.ap-south-1.amazonaws.com/customer-poreprty-documents111111/loan-property-doucments-human-review-wokk-flow/2020/11/11/02/23/59/human-loop-name-1234/output.json")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("error")
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            
            return
        }
        
        let humanreviewModel  = try? JSONDecoder().decode(HumanReviewOutputModel.self ,from: data!) as? HumanReviewOutputModel
    
        print(humanreviewModel?.awsManagedHumanLoopRequestSource ?? "data nil")
    }
    task.resume()
    
   

   let sub = URLSession.shared.dataTaskPublisher(for: url).tryMap { (data, response) in
    guard let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
   
    print("trymap")
    return data
    }.decode(type: HumanReviewOutputModel.self, decoder: JSONDecoder()).receive(on: RunLoop.main).sink(receiveCompletion: { print ("Received completion: \($0).") },
             receiveValue: { humanReviewOutputModel in print ("Received value: \(humanReviewOutputModel.awsManagedHumanLoopRequestSource).")})
    struct ParseError: Error {}
  
    
    
    func romanNumeral(from:Int) throws -> String {
        let romanNumeralDict: [Int : String] =
            [1:"I", 2:"II", 3:"III", 4:"IV", 5:"V"]
        guard let numeral = romanNumeralDict[from] else {
            throw ParseError()
        }
        return numeral
    }
    let numbers = [5, 4, 3, 2, 1,0]
   let  cancellable = numbers.publisher
        .tryMap { try romanNumeral(from: $0) }
        .sink(
            receiveCompletion: { print ("completion: \($0)") },
            receiveValue: { print ("\($0)", terminator: " ") }
         )

}
