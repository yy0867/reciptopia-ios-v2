//
//  ImageCache.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/27.
//

import Foundation
import UIKit

internal class ImageCache {
    
    // MARK: - Properties
    static let shared = ImageCache()
    private var imageCache = NSCache<NSString, UIImage>()
    
    // MARK: - Methods
    /// Fetch image from `url` or cache.
    ///
    /// This method block the thread,
    /// so call this method in background thread.
    func fetchImage(at url: URL, completion: @escaping (UIImage?) -> Void) {
        let urlString = url.absoluteString as NSString
        if let image = imageCache.object(forKey: urlString) {
            completion(image)
        } else {
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url),
                      let image = UIImage(data: data) else {
                    DispatchQueue.main.async { completion(nil) }
                    return
                }
                self.imageCache.setObject(image, forKey: urlString)
                DispatchQueue.main.async { completion(image) }
            }
        }
    }
}
