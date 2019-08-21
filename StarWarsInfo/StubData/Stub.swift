//
//  Stub.swift
//  StarWarsInfo
//
//  Created by curtis scott on 21/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation



struct Stub {
    
    
    static func characters() -> [StarwarsCharacter] {
        var allCharacterss : [StarwarsCharacter] = []
        
        for x in 0...10 {
            let test = StarwarsCharacter(name: " test:\(x)", birthYear: "9045 \(x)", homeworld: "test home\(x)", height: "1.\(x)", eyeColor: "BLue \(x)", hairColor: "yellow \(x)")
            allCharacterss.append(test)
        }
        
        return allCharacterss
        
    }
    
    
}


