//
//  Model.swift
//  Top 9ja news
//
//  Created by Benjamin Inemugha on 08/05/2021.
//

import Foundation

struct News: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Articles]
}

struct Articles: Codable {
    var title: String?
    var description: String?
    var content: String?
}
