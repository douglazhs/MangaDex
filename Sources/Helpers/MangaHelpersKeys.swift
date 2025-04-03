//
//  MangaHelpersKeys.swift
//  MangaDex
//
//  Created by Douglas Henrique de Souza Pereira on 02/04/25.
//

/// MangaDex Keys to use in MangaHelpers.swift
public enum MangaHelpersKeys: String {
    case genre = "genre"
    case theme = "theme"
    
    public enum Tag: String {
        case oneshot = "Oneshot"
        case webcomic = "Web Comic"
        case fullColor = "Full Color"
    }
    
    public enum Relationship: String{
        case scanlationGroup = "scanlation_group"
        case coverArt = "cover_art"
        case author = "author"
        case artist = "artist"
    }
}
