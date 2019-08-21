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
    let length:Double
    let make:String
    let sClass: String
    let cost:Double
    let crew:String
    
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


