//
//  Vehicles.swift
//  StarWarsInfo
//
//  Created by curtis scott on 20/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation


struct VehicleRoot: Codable {
    let next:String?
    let results:[Vehicle]
}


struct Vehicle :Codable {
    
    let name:String
    let manufacturer:String
    let costInCredits:String
    let length:String
    let vehicleClass:String
    let crew:String
    
    
    
}


extension Vehicle: Comparable {
    static func < (lhs: Vehicle, rhs: Vehicle) -> Bool {
        let first = Double(lhs.length)!
        let second = Double(rhs.length)!
        return first < second
    }
    
}
