//
//  TryMapUsecase.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 17/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine
fileprivate var cancelable : AnyCancellable? = nil
fileprivate let url = URL(string: "https://loan-on-property-applcation-bucket.s3.ap-south-1.amazonaws.com/customer-poreprty-documents111111/loan-property-doucments-human-review-wokk-flow/2020/11/11/02/23/59/human-loop-name-1234/output.json")!

   func TryMapUsecase()
   {
    cancelable =  URLSession.shared.dataTaskPublisher(for: url).tryMap { (data: Data, response: URLResponse) -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
        throw URLError(.badServerResponse)
        print("trymap")
        return data
    }.decode(type: HumanReviewOutputModel.self, decoder: JSONDecoder())
    .sink { (completion) in
        switch completion
        {
        case .failure(let error) :
        print("error emitted")
        print(error.localizedDescription)
        case .finished :
            print("finished")
        }
        
    } receiveValue: { (data) in
        print(data.awsManagedHumanLoopRequestSource)
    }

    }
