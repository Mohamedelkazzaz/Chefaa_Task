//
//  ApiService.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 25/12/2023.
//

import Foundation

import Foundation
import UIKit
import Alamofire

protocol ApiService{
    func fetchCharacters(offset: Int,completion: @escaping (([Character]?, Error?) -> Void))
    func fetchResource(uriResource: String,completion: @escaping (([Character]?, Error?) -> Void)) -> DataRequest
}
