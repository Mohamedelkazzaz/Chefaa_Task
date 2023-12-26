//
//  ApiService.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 25/12/2023.
//

import Foundation

import Foundation
import UIKit

protocol ApiService{
    func fetchCharacters(pageNumber: Int, completion: @escaping (([CharacterDataContainer]?, Error?) -> Void))
}
