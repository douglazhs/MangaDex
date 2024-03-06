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
        
    public static let manga: Manga = Manga(
        id: "c52b2ce3-7f95-469c-96b0-479524fb7a1a",
        type: "manga",
        attributes: Attributes(
            title: Languages(en: "Jujutsu Kaisen"),
            description: Languages(
                en: "Yuuji is a genius at track and field. But he has zero interest running around in circles, he's happy as a clam in the Occult Research Club. Although he's only in the club for kicks, things get serious when a real spirit shows up at school! Life's about to get really strange in Sugisawa Town #3 High School!",
                ptBr: "Itadori Yuuji, um estudante do colegial com uma capacidade física única, tem como rotina visitar seu avô que está hospitalizado. Porém, um dia, o selo de um \"objeto amaldiçoado\" escondido em sua escola é rompido, fazendo surgir criaturas assustadoras. Para salvar seus colegas ele parte em direção ao colégio, quando algo inesperado acontece...!"
            ),
            links: MangaLinks(al: "101517"),
            originalLanguage: "ja",
            publicationDemographic: "shounen",
            status: "ongoing",
            year: 2018,
            contentRating: "safe",
            tags: [],
            state: "published",
            updatedAt: "2023-12-16T09:31:09+00:00",
            availableTranslatedLanguages: [
                "it",
                "hu",
                "pt-br",
                "ru",
                "en",
                "es-la",
                "cs",
                "ar",
                "fr",
                "vi",
                "uk",
                "he",
                "id",
                "zh-hk",
                "es",
                "de",
                "sr",
                "th",
                "mn",
                "ms",
                "tr"
            ]
        ),
        relationships: [
            Relationship(
                id: "a6ee382d-25ee-4e8f-8a49-bef48261eba8",
                type:  "cover_art",
                attributes: RelationAttributes(
                    fileName: "40dfaef9-0360-4086-b0d2-d655579bf1d0.jpg"
                )
            )
        ]
    )
}
