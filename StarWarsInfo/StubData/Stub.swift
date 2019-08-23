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
            let test = StarwarsCharacter(name: " hero:\(x)", birthYear: "9045 \(x)", homeworld: "test home\(x)", height: "1.\(x)", eyeColor: "BLue \(x)", hairColor: "yellow \(x)")
            allCharacterss.append(test)
        }
        
        return allCharacterss
        
    }
    
    static func vehicles() -> [Vehicle] {
        var allVehicles : [Vehicle] = []
        
        for x in 0...10 {
            let test = Vehicle(name: " vehicle:\(x)", manufacturer: "testMAn\(x)", costInCredits: "4234434\(x)", length: "100.\(x)", vehicleClass: "ground \(x)", crew: "5\(x)")
            allVehicles.append(test)
        }
        
        return allVehicles
        
    }
    
    static func starships() -> [Starship] {
        var allStarships : [Starship] = []
        
        for x in 0...10 {
            let test = Starship(name: " starship:\(x)", length: "100.\(x)", manufacturer: "test man\(x)", starshipClass: "flying\(x)", costInCredits: "423423\(x)", crew: "5\(x)")
            allStarships.append(test)
        }
        
        return allStarships
        
    }
    
    
}


