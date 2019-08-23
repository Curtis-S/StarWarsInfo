//
//  StarshipVeiwModel.swift
//  StarWarsInfo
//
//  Created by curtis scott on 21/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation




struct StarshipViewModel {
    let name:String
    var length:Double
    let make:String
    let sClass: String
    var cost:Double
    let crew:String
    
    mutating func costInUsd(rate:Double)  {
        self.cost  =  self.cost * rate
    }
    
    mutating func englishHeightInInches()  {
        self.length  =  self.length * 39.37
    }
    
}



extension StarshipViewModel {
    init(starship:Starship) {
        
        self.name = starship.name
        self.make = starship.manufacturer
        self.sClass = starship.starshipClass
        if let cost = Double(starship.costInCredits) {
            self.cost = cost
        } else {
            self.cost = 0
        }
        if let length = Double(starship.length) {
            self.length = length
        } else {
            self.length = 0
        }
        
        self.crew =  starship.crew
    }
    
}


