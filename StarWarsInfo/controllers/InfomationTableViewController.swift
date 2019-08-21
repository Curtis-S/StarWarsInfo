//
//  InfomationTableViewController.swift
//  StarWarsInfo
//
//  Created by curtis scott on 20/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import UIKit

class InfomationTableViewController: UITableViewController {
    let heros = Stub.characters()
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var entityPickerView: UIPickerView!
    
    //info titles
    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    @IBOutlet weak var infoLabel3: UILabel!
    @IBOutlet weak var infoLabel4: UILabel!
    @IBOutlet weak var infoLabel5: UILabel!
    
    
    //info title answers
    @IBOutlet weak var infoAnswer1: UILabel!
    @IBOutlet weak var infoAnswer2: UILabel!
    @IBOutlet weak var infoAnswer3: UILabel!
    @IBOutlet weak var infoAnswer4: UILabel!
    @IBOutlet weak var infoAnswer5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entityPickerView.delegate = self
        entityPickerView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //helper
    
    func setFieldNames(){
        
    }
    

}

extension InfomationTableViewController : UIPickerViewDelegate ,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return   1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heros.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let heroViewModel = CharatcerViewModel(character: heros[row])
        update(title: heroViewModel.name, info1: heroViewModel.born, info2: heroViewModel.home, info3: String(heroViewModel.height), info4: heroViewModel.eyes, info5: heroViewModel.hair)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return heros[row].name
    }
    
    //helper
    
    func update(title:String , info1:String, info2:String, info3:String, info4:String, info5:String){
        self.titleLabel.text = title
        self.infoAnswer1.text = info1
        self.infoAnswer2.text = info2
        self.infoAnswer3.text = info3
        self.infoAnswer4.text = info4
        self.infoAnswer5.text = info5
        
    }
    
    
}
