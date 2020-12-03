//
//  UIImageView+Extension.swift
//  DemoApp
//
//  Created by Crystal on 2020/12/4.
//

import UIKit

extension UIImageView {

    func load(urlString: String, id: Int) {

        guard let url = URL(string: urlString) else {
            self.image = UIImage()
            return
        }

        guard let image = CacheManager.shared.imageCache.object(forKey: id as NSNumber) else {
            DispatchQueue.global().async { [weak self] in
                guard let data = try? Data(contentsOf: url),
                      let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    self?.image = image
                    CacheManager.shared.imageCache.setObject(image, forKey: id as NSNumber)
                    print("set cache image fore key \(url)")
                }
            }
            return
        }
        print("use cache image fore key \(url)")
        self.image = image
    }
}
