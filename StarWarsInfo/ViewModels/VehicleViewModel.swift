//
//  VehicleViewModel.swift
//  StarWarsInfo
//
//  Created by curtis scott on 21/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation


struct VehicleViewModel {
    
    let name:String
    let make:String
    let cost:Double
    let length:Double
    let vClass:String
    let crew:String
    
    
    
}


extension VehicleViewModel {
    init(vehicle:Vehicle ) {
        self.name = vehicle.name
        self.make = vehicle.manufacturer
        self.vClass = vehicle.vehicleClass
        if let cost = Double(vehicle.costInCredits) {
            self.cost = cost
        } else {
            self.cost = 0
        }
        if let length = Double(vehicle.length) {
            self.length = length
        } else {
            self.length = 0
        }
        
        self.crew =  vehicle.crew
    }
    
    
}

