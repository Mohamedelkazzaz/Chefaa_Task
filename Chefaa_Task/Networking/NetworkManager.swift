//
//  NetworkManager.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 25/12/2023.
//

import Foundation
import Foundation
import UIKit

class NetworkManager: ApiService{
    func fetchCharacters(pageNumber: Int, completion: @escaping (([CharacterDataContainer]?, Error?) -> Void)) {
        if let url = URL(string: Url(pageNumber: pageNumber).url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    guard let decodedData = try? JSONDecoder().decode([CharacterDataContainer].self, from: data) else{ return}
                    completion(decodedData,nil)
                    print(decodedData)
                    
                }
                if let error = error {
                    completion(nil,error)
                }
            }.resume()
        }
    }
    
    

}
