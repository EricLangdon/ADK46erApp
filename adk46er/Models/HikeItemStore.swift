//
//  HikeItemStore.swift
//  adk46er
//
//  Created by Eric Langdon on 3/22/20.
//  Copyright © 2020 Eric Langdon. All rights reserved.
//

import UIKit

class HikeItemStore {
    
    var allItems = [HikeItem]()
    
    //Initializers
    init() {
        for _ in 0..<10 {
            createItem()
        }
    }
    
    //Methods
    @discardableResult func createItem() -> HikeItem {
        
        let newItem = HikeItem(rand: true)
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item : HikeItem) {
        if let idx = allItems.firstIndex(of: item) {
            allItems.remove(at: idx)
        }
    }
}
