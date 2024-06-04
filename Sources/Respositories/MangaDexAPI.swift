//
//  MangaDexAPI.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 13/07/23.
//

import Foundation
import UIKit
import Combine

public protocol MangaDexAPIProtocol {
    /// Build URL
    /// - Parameter target: Choosen target
    /// - Returns: Built URL
    func buildURL(for target: MangaDexNetworking) -> URL?
    
    /// Get random manga
    /// - Parameter completion: Request Result
    /// - Parameter params: Request parameters
    func getRandomManga(params: [String: Any], offset: Int, completion: @escaping (Result<MangaData, Error>) -> Void)
    
    /// Get manga feed
    /// - Parameters:
    ///   - id: Manga id
    ///   - params: Request parameters
    ///   - completion: Manga chapters
    func getMangaFeed(id: String, params: [String : Any], completion: @escaping (Result<ChapterInfoResult, Error>) -> Void)
    
    /// Get chapter
    /// - Parameters:
    ///   - id: Chapter id
    ///   - completion: Chapter images
    func getChapter(id: String, completion: @escaping (Result<ChapterResourceResult,Error>) -> Void)
    
    /// Get manga by name
    /// - Parameters:
    ///   - name: Manga name
    ///   - params: Request parameters
    ///   - completion: Mangas
    func getByName(_ name: String, params: [String : Any], completion: @escaping (Result<MangaData,Error>) -> Void)
    
    /// Get manga by id
    /// - Parameters:
    ///   - id: Manga id
    ///   - completion: Mangas
    func getById(_ id: String, completion: @escaping (Result<MangaResult,Error>) -> Void)
    
    
    /// Get manga cover list
    /// - Parameters:
    ///   - id: Manga id
    ///   - completion: Cover list
    func getCoverList(_ id: String, completion: @escaping (Result<CoverData,Error>) -> Void)
}

public class MangaDexAPI: BaseAPI<MangaDexNetworking>, MangaDexAPIProtocol {
    public override init() { }
    
    public func getRandomManga(
        params: [String : Any],
        offset: Int = 0,
        completion: @escaping (Result<MangaData, Error>) -> Void
    ) {
        self.fetchData(
            target: .getRandom(
                params: params,
                offset: offset
            ),
            responseClass: MangaData.self
        ) { completion($0) }
    }
    
    public func getMangaFeed(
        id: String,
        params: [String : Any],
        completion: @escaping (Result<ChapterInfoResult, Error>) -> Void
    ) {
        self.fetchData(
            target: .feed(id: id, params: params),
            responseClass: ChapterInfoResult.self
        ) { completion($0) }
    }
    
    public func getChapter(
        id: String,
        completion: @escaping (Result<ChapterResourceResult,Error>) -> Void
    ) {
        self.fetchData(
            target: .chapter(id),
            responseClass: ChapterResourceResult.self
        ) { completion($0) }
    }
    
    public func getByName(
        _ name: String,
        params: [String : Any],
        completion: @escaping (Result<MangaData,Error>) -> Void
    ) {
        self.fetchData(
            target: .getByName(name, params: params),
            responseClass: MangaData.self
        ) { completion($0) }
    }
    
    public func getById(
        _ id: String,
        completion: @escaping (Result<MangaResult,Error>) -> Void
    ) {
        self.fetchData(
            target: .getById(id),
            responseClass: MangaResult.self
        ) { completion($0) }
    }
    
    public func getCoverList(
        _ id: String,
        completion: @escaping (Result<CoverData,Error>) -> Void
    ) {
        self.fetchData(
            target: .coverList(id: id),
            responseClass: CoverData.self
        ) {
            completion($0)
        }
    }
    
    public func buildURL(for target: MangaDexNetworking) -> URL? {
        guard let url = URL(string: target.baseURL + target.path) else {
            return nil
        }
        return url
    }
}
