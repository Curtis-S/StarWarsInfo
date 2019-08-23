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
        
        
            print("finashed ")
      
        
        print("hello")
        
        self.tableView.backgroundColor = UIColor.black
        
        
    }
    
    
    func test(){
        
        
        
    }
    
    func getAllHeros(){
      
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view cont
        
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
