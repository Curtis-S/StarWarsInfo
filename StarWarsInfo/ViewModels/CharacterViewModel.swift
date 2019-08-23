//
//  CharacterViewModel.swift
//  StarWarsInfo
//
//  Created by curtis scott on 21/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation



struct CharatcerViewModel {
    let name:String
    let born:String
    let home:String
    var height:Double
    let eyes:String
    let hair:String
    var englishHeightInInches:Double {
       return self.height * 39.37
    }
    
}

extension CharatcerViewModel {
    init(character:StarwarsCharacter ) {
        
        self.name = character.name
        self.born = character.birthYear
        self.eyes = character.eyeColor
        self.home = character.homeworld
       if let height = Double(character.height) {
             self.height = height
      } else {
        self.height = 0
        }

        self.hair =  character.hairColor
    }
    
    mutating func convertHeightToInches() {
        self.height = self.height * 39.37
    }
    
}



