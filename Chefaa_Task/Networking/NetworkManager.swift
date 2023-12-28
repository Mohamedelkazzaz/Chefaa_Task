//
//  NetworkManager.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 25/12/2023.
//

import Foundation
import UIKit
import Alamofire
import CommonCrypto

class NetworkManager: ApiService{
   
    private static let apiKey = "97ac84ccfa873d9c1d7583c15eff48d5"
    private static let ts = ""
    private static let privateKey = "073cd3d9c8fcab7e4228035d3eb31821e1e86277"
    private var hash: String {
        let hashValue = NetworkManager.ts + NetworkManager.privateKey + NetworkManager.apiKey
        return self.md5(hashValue)
    }
    
     func fetchCharacters(offset: Int,completion: @escaping (([Character]?, Error?) -> Void)) {
           
         let url = URL(string: Url().url + "characters?")

        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let paramters: [String: Any] = [
            "apikey": NetworkManager.apiKey,
            "ts": "1",
            "hash": "ac784447611653165bc71c53d4b45595",
            "offset": offset
        ]
       
        AF.request(url!,
                   method: .get,
                   parameters: paramters,
                   encoding: URLEncoding.default, headers: headers).response { (response:DataResponse)  in
            switch(response.result) {
            case .success(let value):
                do{
                    let characterResponse = try JSONDecoder().decode(CharacterDataWrapper.self, from: value ?? Data())
                    completion(characterResponse.data?.results, nil)
                } catch (let err){
                    print(err)
                    completion(nil, err)
                }
            case .failure(let err):
                print(err)
                completion(nil, err)
            }
        }
    }

    
//    func getCharacterById(characterId: Int,completion: @escaping (([Character]?, Error?) -> Void)) {
//        if let url = URL(string: Url().url + "\(characterId)"){
//            var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//            let parameters: [String: Any] = [
//                "apikey": NetworkManager.apiKey,
//                "ts": "1",
//                "hash": hash
//            ]
//
//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
//            } catch {
//                print("Error encoding parameters: \(error)")
//                return
//            }
//            print(request)
//            URLSession.shared.dataTask(with: request) { data, response, error in
//               
//                do{
//                    let decodedData = try JSONDecoder().decode(CharacterDataWrapper.self, from: data ?? Data())
//                    completion(decodedData.data?.results,nil)
//                }catch(let error){
//                    completion(nil,error)
//                    print(error)
//                }
//            }.resume()
//        }
//    }
    
    
    func md5(_ string: String) -> String {
        if let data = string.data(using: .utf8) {
            var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            _ = data.withUnsafeBytes {
                CC_MD5($0.baseAddress, CC_LONG(data.count), &digest)
            }

            return digest.map { String(format: "%02hhx", $0) }.joined()
        }

        return ""
    }

}
