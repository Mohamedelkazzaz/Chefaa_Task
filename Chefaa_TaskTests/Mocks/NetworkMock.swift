//
//  NetworkMock.swift
//  Chefaa_TaskTests
//
//  Created by Mohamed Elkazzaz on 29/12/2023.
//

import Foundation


@testable import Chefaa_Task

class NetworkMock:ApiService{
   
    
    
    var shouldReturnError: Bool
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    
    
//    let jsonResponse : [String : [[String : Any]]] = []
    
                
   
    func fetchCharacters(offset: Int, completion: @escaping (([Chefaa_Task.Character]?, Error?) -> Void)) {
        <#code#>
    }
    
    func fetchResource(uriResource: String, completion: @escaping (([Chefaa_Task.Character]?, Error?) -> Void)) {
        <#code#>
    }
   
    
    

}


enum NetworkError: Error {
    case failedFetchingData
}
