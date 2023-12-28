//
//  Character.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 26/12/2023.
//

import Foundation


// MARK: - CharacterDataWrapper
struct CharacterDataWrapper: Codable {
//    let code: Int?
//     let status, copyright, attributionText: String?
//    let attributionHTML: String?
    let data: CharacterDataContainer?
//    let etag: String?
}

// MARK: - DataClass
struct CharacterDataContainer: Codable {
    let offset, limit, total, count: Int?
    let results: [Character]?
}

// MARK: - Result
struct Character: Codable {
    let id: Int?
    let name, description, modified: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    let events, series: Comics?
}

// MARK: - Comics
struct Comics: Codable {
    let available, returned: Int?
    let  collectionURI: String?
    let items: [ComicsItem]?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI, name: String?
}

// MARK: - Stories
struct Stories: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI, name, type: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path, thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension 
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type, url: String?
}
