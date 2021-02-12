//
//  ResultEnuUsecase.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 11/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine

enum  NetworkError : Error {
    case badURL
    case domainError
    case ServerError
    case decodeError
    
}
let urlString =  "https://loan-on-property-applcation-bucket.s3.ap-south-1.amazonaws.com/customer-poreprty-documents111111/loan-property-doucments-human-review-wokk-flow/2020/11/11/02/23/59/human-loop-name-1234/output.json"

let listOfusersUrl = "https://jsonplaceholder.typicode.com/users"

func executeAPI<T:Decodable>(for url : String, model : T.Type) -> Future<T,NetworkError>
{
    return Future(){ prmomise in
        guard let url = URL(string: url) else {
            prmomise(Result.failure(NetworkError.badURL))
            return
        }
        
       URLSession.shared.dataTask(with:  url) { (data, response, error) in
         guard let httpResponse = response as? HTTPURLResponse,
             httpResponse.statusCode == 200 else {
            prmomise(Result.failure(NetworkError.ServerError))
            return
             }
        
        guard let responseData = data  else {
            return
        }
        
        do {
            let model = try JSONDecoder().decode(  model.self, from:  responseData)
              prmomise(Result.success(model))
            
        }catch {
            prmomise(Result.failure(NetworkError.decodeError))
        }
         
        }.resume()
    }
}



