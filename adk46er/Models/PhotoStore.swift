//
//  PhotoSotre.swift
//  adk46er
//
//  Created by Eric Langdon on 4/17/20.
//  Copyright © 2020 Eric Langdon. All rights reserved.
//

import UIKit

class PhotoStore {
    let cache = NSCache<NSString, UIImage>()
    
    
    func setImg (_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func img (forkey key : String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func deleteImg (forkey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
