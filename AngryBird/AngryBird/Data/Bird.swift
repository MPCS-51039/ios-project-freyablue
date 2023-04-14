//
//  Bird.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/4/6.
//

import Foundation

class Bird:CustomDebugStringConvertible {
    var debugDescription: String {
        return "Whale(name:\(self.name),description:\(self.description))"
    }
    
    var name : String
    var description : String
    var imageURL: String
    var confirmedSighting: Bool = false
    
    init(named name:String, description:String, imageURL:String){
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }
    
}
