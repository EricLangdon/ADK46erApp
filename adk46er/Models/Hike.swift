//
//  hikeItem.swift
//  adk46er
//
//  Created by Eric Langdon on 3/22/20.
//  Copyright © 2020 Eric Langdon. All rights reserved.
//

import UIKit

class Hike : NSObject {
    
    var name : String
    var valDollars : Int
    var serialNum : String?
    var date : Date
    var key : String
    
    //Initializers
    
    init(n : String, v : Int, s : String?) {
        name = n
        valDollars = v
        serialNum = s
        date = Date()
        key = UUID.init().uuidString
        
        super.init()
    }
    
    convenience init (rand : Bool = false) {
        if rand {
            let adj = ["High", "Beautiful", "Rocky"]
            let noun = ["Peak", "Summit", "Mountain"]
            
            var idx = arc4random_uniform(UInt32(adj.count))
            let randAdj = adj[Int(idx)]
            
            idx = arc4random_uniform(UInt32(noun.count))
            let randNoun = noun[Int(idx)]
            
            let randName = "\(randAdj) \(randNoun)"
            
            let randNum = Int(arc4random_uniform(100))
            let randSerial = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(n : randName, v : randNum, s : randSerial)
            
        } else {
            self.init(n : "", v : 0, s : nil)
        }
    }
}
