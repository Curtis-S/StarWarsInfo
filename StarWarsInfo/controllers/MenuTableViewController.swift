//
//  MenuTableViewController.swift
//  StarWarsInfo
//
//  Created by curtis scott on 20/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    
    var heros: [StarwarsCharacter] = []
    var vehicles:[Vehicle] = []
    var starships:[Starship] = []
    let client = StarWarsApiClient()
    var heroPage:Root?
    
    
    
    
    
    enum MenuSelection {
        case Characters
        case Vehicles
        case Starships
        
    }
    
    var menuChoice: MenuSelection = .Characters
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.backgroundColor = UIColor.black
        
    }
    
 
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
        switch segue.identifier {
        case "ShowCharacters":
            self.menuChoice = .Characters
            
            break
        case "ShowVehicles":
            self.menuChoice = .Vehicles
            break
            
        case "ShowStarships":
            self.menuChoice = .Starships
            break
            
        default:
            self.menuChoice = .Vehicles
            break
        }
        
        let infoController = segue.destination as! InfomationTableViewController
        
        infoController.menu = self
        
    }
    
    
}
