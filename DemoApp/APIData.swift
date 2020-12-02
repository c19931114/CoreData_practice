//
//  APIData.swift
//  DemoApp
//
//  Created by 劉良瑋 on 2020/12/1.
//

import Foundation

struct APIData: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
