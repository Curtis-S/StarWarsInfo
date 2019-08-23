//
//  Characters.swift
//  StarWarsInfo
//
//  Created by curtis scott on 20/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation

struct Root: Codable {
    let next:String?
    let results:[StarwarsCharacter]
}


struct StarwarsCharacter:Codable {
    let name:String
    let birthYear:String
    var homeworld:String
    let height:String
    let eyeColor:String
    let hairColor:String
    
    mutating func setHomeWorld (homeworld:String){
        self.homeworld = homeworld
    }
    
}

struct CharacterHomeWorld:Codable {
    let name:String
}



extension StarwarsCharacter: Comparable {
    
    static func < (lhs: StarwarsCharacter, rhs: StarwarsCharacter) -> Bool {
        let first = Double(lhs.height)!
        let second = Double(rhs.height)!
        return first < second
        
        
       
    }
    
    
    
    
    
}

