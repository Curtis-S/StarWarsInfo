//
//  Starships.swift
//  StarWarsInfo
//
//  Created by curtis scott on 20/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation


struct StarshipRoot: Codable {
    let next:String?
    let results:[Starship]
}


struct Starship: Codable {
    let name:String
    let length:String
    let manufacturer:String
    let starshipClass: String
    let costInCredits:String
    let crew:String
    
}


extension Starship: Comparable {
    static func < (lhs: Starship, rhs: Starship) -> Bool {
        let first = Double(lhs.length)!
        let second = Double(rhs.length)!
        return first < second
        
    }
    
    
   
}
