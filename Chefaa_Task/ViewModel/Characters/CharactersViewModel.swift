//
//  CharactersViewModel.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 25/12/2023.
//

import Foundation

class CharactersViewModel {
var searchedText = ""
var characterModel: Character?
var character: [Character] = [] {
    didSet {
        filterdCharacters = character

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
    fetchCharacters(offset: 1)
}

func checkIfNeedToFetchNewPage() {
    guard searchedText.isEmpty else{
        return
    }
    let offset = self.character.count / 20 + 1
    fetchCharacters(offset: offset)
}

private func fetchCharacters(offset: Int){
    apiService.fetchCharacters(offset: offset) { characters, error in
        if let characters = characters {
    
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
