//
//  HikeItemStore.swift
//  adk46er
//
//  Created by Eric Langdon on 3/22/20.
//  Copyright © 2020 Eric Langdon. All rights reserved.
//

import UIKit

class HikeItemStore {
    
    var allItems = [Hike]()
    
    let hikeURL : URL = {
        let docDirecs =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirec = docDirecs.first!
        
        return docDirec.appendingPathComponent("items.archive")
    }()
    
    
    //Initializers
    init() {
        for _ in 0..<10 {
            createItem()
        }
    }
    
    //Methods
    @discardableResult func createItem() -> Hike {
        
        let newItem = Hike(rand: true)
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item : Hike) {
        if let idx = allItems.firstIndex(of: item) {
            allItems.remove(at: idx)
        }
    }
    
    func moveItem (from fIdx : Int, to tIdx : Int) {
        if fIdx == tIdx {
            return
        }
        
        let mItem = allItems[fIdx]
        allItems.remove(at: fIdx)
        allItems.insert(mItem, at: tIdx)
    }
    
    
    func saveChanges() -> Bool {
        print("Saving to: \(hikeURL.path)")
        
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: hikeURL.path)
    }
}
