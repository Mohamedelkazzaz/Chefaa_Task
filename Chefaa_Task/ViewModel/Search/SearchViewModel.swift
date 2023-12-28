//
//  SearchViewModel.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 28/12/2023.
//

import Foundation
import UIKit

class SearchViewModel {
    var searchedText = ""
    
    var character: [Character] = [] {
        didSet {
            filterdCharacters = character
            search(with: searchedText)
        }
    }
    var filterdCharacters: [Character] = [] {
        didSet {
            bindingData(filterdCharacters,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let apiService: ApiService
    var bindingData: (([Character]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiService = NetworkManager()) {
        self.apiService = apiService
    }
    
    func viewIsloaded() {
        fetchCharacters(param: searchedText, offset: 1)
    }
    
    func checkIfNeedToFetchNewPage() {
        guard searchedText.isEmpty else{
            return
        }
        let offset = self.character.count / 20 + 1
        fetchCharacters(param: searchedText, offset: offset)
    }

    
    func search(with: String) {
        searchedText = with
        if with.isEmpty {
            filterdCharacters.removeAll()
            return
        }
        
        self.filterdCharacters = self.character.filter { itemCharacter in
            return itemCharacter.name?.contains(with) ?? false
        }
    }
    
    private func fetchCharacters(param: String, offset: Int){
        apiService.fetchCharacters(offset: offset) { characters, error in
            if let characters = characters {
                // add to core data
                
                
                self.character.append(contentsOf: characters)
                print(self.character)
            }
            if let error = error {
                self.error = error
            }
        }
    }
    
    func getCharacters() -> [Character]?{
        return filterdCharacters
        
    }
    
    func getCharacter(indexPath: IndexPath) -> Character?{
        guard indexPath.row < filterdCharacters.count else{
            return nil
        }
        return filterdCharacters[indexPath.row]
    }
    
}
