//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 05/03/24.
//

import Foundation

public class MangaMock {
    public static let coverUrl: URL? = URL(
        string: "https://uploads.mangadex.org/covers/32d76d19-8a05-4db0-9fc2-e0b0648fe9d0/e90bdc47-c8b9-4df7-b2c0-17641b645ee1.jpg"
    )
        
    public static func manga() -> Manga {
        return Manga(
            id: "c52b2ce3-7f95-469c-96b0-479524fb7a1a",
            type: "manga"
        )
    }
}
