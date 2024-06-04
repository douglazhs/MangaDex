//
//  Cover.swift
//
//
//  Created by Douglas Henrique de Souza Pereira on 04/06/24.
//

import Foundation

public struct CoverData: Codable {
    public var data: [Cover]
}

public struct Cover: Identifiable, Hashable, Codable {
    public static func == (lhs: Cover, rhs: Cover) -> Bool {
        lhs.id  == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) { }
    
    public var id: String
    public var type: String
    public var attributes: CoverAttributes
}

public struct CoverAttributes: Codable {
    public var description: String?
    public var volume: String
    public var fileName: String?
    public var locale: String?
    public var createdAt: String?
    public var updatedAt: String?
    public var version: Int?
    public var relationships: [CoverRelationship]?
}

public struct CoverRelationship: Codable {
    public var id: String
    public var type: String
}
