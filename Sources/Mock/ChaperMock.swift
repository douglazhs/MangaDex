//
//  File.swift
//  
//
//  Created by Douglas Henrique de Souza Pereira on 05/03/24.
//

import Foundation

public class ChapterMock {
    public static let chapter: Chapter  = Chapter(
        id: "63fa9806-7131-48d1-a984-72f0796037d2",
        attributes: ChapterAttributes(
            volume: "1",
            chapter: "1",
            title: "Ryomen Sukuna",
            createdAt: "2018-07-20T06:46:40+00:00",
            pages: 54
        ),
        relationships: [
            ChapterRelationships(
                id: "4f64cede-4438-49ac-9d90-b7e7c02bb1dc",
                type: "scanlation_group",
                attributes: ChapterRelationshipsAttributes(
                    name: "Gekkou Scans",
                    updatedAt: "2023-10-20T16:47:00+00:00"
                )
            )
        ]
    )
}
