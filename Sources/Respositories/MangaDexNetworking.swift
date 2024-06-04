//
//  MangaDexNetworking.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/07/23.
//

import Foundation
import Alamofire

public enum MangaDexNetworking {
    case getRandom(params: [String : Any], offset: Int)
    case getById(String)
    case getByName(String, params: [String : Any])
    case cover(id: String, fileName: String)
    case coverList(id: String)
    case feed(id: String, params: [String : Any])
    case chapter(String)
    case chapterImage(quality: DataQuality, hash: String, fileName: String)
}

extension MangaDexNetworking: TargetType {
    public var baseURL: String {
        switch self {
        case .chapterImage(_, _, _), .cover(_, _):
            return URLs.mdUploads.description
        default:
            return URLs.mdBase.description
        }
    }
    
    public var path: String {
        switch self {
        case .getRandom(_, let offset):
            return "/manga?includes[]=cover_art&includes[]=author&includes[]=artist&offset=\(offset)"
        case .getById(let id):
            return "/manga/\(id)?includes[]=author&includes[]=artist&includes[]=cover_art"
        case .getByName(let name, _):
            return "/manga?title=\(name)&includes[]=cover_art&includes[]=author&includes[]=artist"
        case .cover(let id, let fileName):
            return "/covers/\(id)/\(fileName)"
        case .coverList(let id):
            return "/cover?manga[]=\(id)&order[volume]=desc&limit=100"
        case .feed(let id, _):
            return "/manga/\(id)/feed?includes[]=scanlation_group"
        case .chapter(let id):
            return "/at-home/server/\(id)"
        case .chapterImage(let quality,
                           let hash,
                           let fileName):
            return "/\(quality.rawValue)/\(hash)/\(fileName)"
        }
    }
    
    public var method: HTTPMethod { return .get }
    
    public var task: TaskElement {
        switch self {
        case .getRandom(let params, _), .feed(_, params: let params), .getByName(_, params: let params):
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding(arrayEncoding: .noBrackets)
            )
        default: return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
}
