//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/07/23.
//

import Foundation

public struct MangaData: Codable {
    public var data: [Manga]
}

/// MangaDex Manga
public struct Manga: Identifiable, Codable {
    public var id: String
    public var type: String?
    public var attributes: Attributes?
    public var relationships: [Relationship]?
}

public struct Attributes: Codable {
    public var title: Languages?
    public var description: Languages?
    public var publicationDemographic: String?
    public var status: String?
    public var year: Int?
    public var contentRating: String?
    public var tags: [Tag]?
    public var state: String?
    public var updatedAt: String?
    public var availableTranslatedLanguages: [String?]?
}

public struct Languages: Codable {
    public var en: String?
    public var ptBr: String?
    
    private enum CodingKeys: String, CodingKey {
        case en, ptBr = "pt-br"
    }
}

public struct Relationship: Codable {
    public var id: String?
    public var type: String?
    public var attributes: RelationAttributes?
}

public struct Tag: Codable {
    public var id: String?
    public var type: String?
    public var attributes: TagAttributes?
}

public struct RelationAttributes: Codable {
    public var name: String?
    public var fileName: String?
}

public struct TagAttributes: Codable {
    public var name: Languages?
    public var group: String?
}