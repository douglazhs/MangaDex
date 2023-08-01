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

public struct MangaResult: Codable {
    public var data: Manga
}

/// MangaDex Manga
public struct Manga: Identifiable, Hashable, Codable {
    public static func == (lhs: Manga, rhs: Manga) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) { }
    
    public var id: String
    public var type: String?
    public var attributes: Attributes?
    public var relationships: [Relationship]?
}

public struct Attributes: Codable {
    public var title: Languages?
    public var description: Languages?
    public var links: MangaLinks?
    public var originalLanguage: String?
    public var publicationDemographic: String?
    public var status: String?
    public var year: Int?
    public var contentRating: String?
    public var tags: [Tag]?
    public var state: String?
    public var updatedAt: String?
    public var availableTranslatedLanguages: [String?]?
}

public struct MangaLinks: Codable {
    public var al: String?
}

public struct Languages: Codable {
    public var en: String?
    public var ptBr: String?
    public var jaRo: String?
    
    enum CodingKeys: String, CodingKey {
        case en = "en", ptBr = "pt-br", jaRo = "ja-ro"
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
