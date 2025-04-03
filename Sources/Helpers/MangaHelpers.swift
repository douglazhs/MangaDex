//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 20/07/23.
//

import Foundation

public protocol MangaHelpers {
    /// Get a tag value
    /// - Parameters:
    ///   - key: Tag key
    ///   - manga: Current manga
    /// - Returns: Value associated to the key
    func getTag(_ key: MangaHelpersKeys.Tag, of manga: Manga) -> String?
    
    /// Get tags releated to the key
    /// - Parameters:
    ///   - key: Tag key
    ///   - manga: Current manga
    /// - Returns: Values associated to the key
    func getTags(with key: String, of manga: Manga) -> [String]?
    
    /// Get a manga relationship value of a key
    /// - Parameters:
    ///   - key: Object key
    ///   - manga: Current manga
    /// - Returns: Value associated to the key
    func relationship(_ key: MangaHelpersKeys.Relationship, with manga: Manga) -> String
    
    /// Get a chapter relationship value of a key
    /// - Parameters:
    ///   - key: Object key
    ///   - chapter: Current chapter
    /// - Returns: Value associated to the key
    func relationship(_ key: MangaHelpersKeys.Relationship, with chapter: Chapter) -> String
    
    /// Convert the manga genres in one string
    /// - Parameter manga: Current manga
    /// - Returns: Converted string with all genres
    func getGenres(of manga: Manga) -> [String]
    
    /// Get cover art file name of manga
    /// - Parameter manga: Current manga
    /// - Parameter quality: Cover quality
    /// - Returns: Cover art file name
    func imgFileName(of manga: Manga, quality: String) -> String
    
    /// Get cover art file name of cover
    /// - Parameter cover: Current cover
    /// - Parameter quality: Cover quality
    /// - Returns: Cover art file name
    func imgFileName(of cover: Cover, quality: String) -> String
    
    /// Unweaps manga title
    /// - Parameter manga: Current manga
    /// - Returns: Unwrapped manga title
    func unwrapTitle(of manga: Manga) -> String
}

public extension MangaHelpers {
    func getTag(_ key: MangaHelpersKeys.Tag, of manga: Manga) -> String? {
        guard let tags = manga.attributes?.tags,
              let tag = tags.first(
                where: {($0.attributes?.name?.en ?? "").contains(key.rawValue)}
              )
        else { return nil }
        return tag.id
    }
    
    func getTags(with key: String, of manga: Manga) -> [String]? {
        guard let tags = manga.attributes?.tags?.filter({ $0.attributes?.group == key }) else {
            return nil
        }
        return tags.map { $0.attributes?.name?.en ?? "" }
    }
    
    func relationship(_ key: MangaHelpersKeys.Relationship, with manga: Manga) -> String {
        guard let relationships = manga.relationships,
              let entity = relationships.first(where: { $0.type == key.rawValue })
        else { return "" }
        return entity.attributes?.name ?? ""
    }

    func relationship(_ key: MangaHelpersKeys.Relationship, with chapter: Chapter) -> String {
        guard let relationships = chapter.relationships,
              let entity = relationships.first(where: { $0.type == key.rawValue })
        else { return "" }
        return entity.attributes?.name ?? ""
    }

    func getGenres(of manga: Manga) -> [String] {
        guard let tags = manga.attributes?.tags else { return [] }
        let genres = tags.filter {
            $0.attributes?.group ?? "" == MangaHelpersKeys.theme.rawValue ||
            $0.attributes?.group ?? "" == MangaHelpersKeys.genre.rawValue
        }
        return genres.compactMap { $0.attributes?.name?.en ?? "" }
    }

    func imgFileName(of manga: Manga, quality: String) -> String {
        guard let cover = manga.relationships?.first(where: {
            $0.type == MangaHelpersKeys.Relationship.coverArt.rawValue
        }), let fileName = cover.attributes?.fileName else {
            return ""
        }
        return fileName + quality
    }
    
    func imgFileName(of cover: Cover, quality: String) -> String {
        guard let fileName = cover.attributes.fileName else {
            return ""
        }
        return fileName + quality
    }
    
    func unwrapTitle(of manga: Manga) -> String {
        guard let en = manga.attributes?.title?.en else {
            if let jaRo = manga.attributes?.title?.jaRo {
                return jaRo
            }
            return ""
        }
        return en
    }
}
