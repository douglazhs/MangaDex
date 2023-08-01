//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 17/07/23.
//

import Foundation

public struct ChapterResourceResult: Codable {
    public var chapter: ChapterResource?
}

/// MangaDex chapter resource
public struct ChapterResource: Hashable, Codable {
    public var hash: String?
    public var data: [String]?
    public var dataSaver: [String]?
}

public struct ChapterInfoResult: Codable {
    public var data: [Chapter]?
    public var total: Int?
}

/// MangaDex chapter
public struct Chapter: Identifiable, Hashable, Codable {
    public func hash(
        into hasher:
        inout Hasher
    ) { }
    
    public static func == (
        lhs: Chapter,
        rhs: Chapter
    ) -> Bool { lhs.id == rhs.id }
    
    public var id: String?
    public var attributes: ChapterAttributes?
    public var relationships: [ChapterRelationships]?
    
}

public struct ChapterAttributes: Codable {
    public var volume: String?
    public var chapter: String?
    public var title: String?
    public var createdAt: String?
    public var pages: Int?
}

public struct ChapterRelationships: Codable {
    public var id: String?
    public var type: String?
    public var attributes: ChapterRelationshipsAttributes?
}

public struct ChapterRelationshipsAttributes: Codable {
    public var name: String?
    public var updatedAt: String?
}
