//
//  NetworkMock.swift
//  Chefaa_TaskTests
//
//  Created by Mohamed Elkazzaz on 29/12/2023.
//

import Foundation
import Alamofire


@testable import Chefaa_Task

class NetworkMock:ApiService{
   
    var fetchCharactersCallCount = 0
    
     func fetchCharacters(offset: Int, completion: @escaping ([Character]?, Error?) -> Void) {
        
         let dummyCharacters: [Character] = []
         completion(dummyCharacters, nil)
         
         
         fetchCharactersCallCount += 1
     }
 
    
    func fetchResource(uriResource: String, completion: @escaping (([Chefaa_Task.Character]?, Error?) -> Void)) -> DataRequest {
        <#code#>
    }
   
    
}


