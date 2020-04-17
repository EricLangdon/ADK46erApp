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
    
    func imageURL(forKey key : String) -> URL {
        let docDirecs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirec = docDirecs.first!
        
        return docDirec.appendingPathComponent(key)
    }
    
    func setImage(_ image : UIImage, forkey key : String) {
        cache.setObject(image, forKey: key as NSString)
        
        let url = imageURL(forKey: key)
        if let data = image.jpegData(compressionQuality: 0.5) {
            let _ = try? data.write(to: url, options: [.atomic])
        }
    }
    
    func image(forKey key : String) -> UIImage? {
        if let curImg = cache.object(forKey: key as NSString) {
            return curImg
        }
        
        let url = imageURL(forKey: key)
        guard let imgDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        cache.setObject(imgDisk, forKey: key as NSString)
        
        return imgDisk
    }
    
    func delImg(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
        let url = imageURL(forKey: key)
        
        do {
            try FileManager.default.removeItem(at: url)

        } catch let deleteError {
            print ("Error removing img from disk: \(deleteError)")
        }
        
    }
}
