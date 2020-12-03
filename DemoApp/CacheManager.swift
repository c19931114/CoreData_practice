//
//  CacheManager.swift
//  DemoApp
//
//  Created by Crystal on 2020/12/4.
//

import UIKit

class CacheManager {
    static let shared = CacheManager()
    let imageCache = NSCache<NSNumber, UIImage>()
}
