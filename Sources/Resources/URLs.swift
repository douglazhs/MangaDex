//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 12/07/23.
//

import Foundation

public enum URLs: CustomStringConvertible {
    case mdBase, mdUploads
    
    public var description: String {
        switch self {
        case .mdBase: return "https://api.mangadex.org"
        case .mdUploads: return "https://uploads.mangadex.org"
        }
    }
}
