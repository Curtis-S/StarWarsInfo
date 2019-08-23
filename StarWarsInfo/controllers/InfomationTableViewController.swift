//
//  InfomationTableViewController.swift
//  StarWarsInfo
//
//  Created by curtis scott on 20/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import UIKit

class InfomationTableViewController: UITableViewController {
    enum MetircComvertion {
        case Meters
        case Inches
    }
    
    enum creditConversion {
        case Credits
        case USD
    }
    
    let heros = Stub.characters()
    let vehicles = Stub.vehicles()
    let starships = Stub.starships()
    
    weak var menu: MenuTableViewController?
    
    var cost:creditConversion = .Credits
    var lengthAndHeight:MetircComvertion = .Meters
    
    //outlets
    
    @IBOutlet weak var exchangeRateTextField: UITextField!
    @IBOutlet weak var UsdButton: UIButton!
    @IBOutlet weak var CreditButton: UIButton!
    @IBOutlet weak var MetricButton: UIButton!
    @IBOutlet weak var EnglishButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var entityPickerView: UIPickerView!
    
    @IBOutlet weak var costStackView: UIStackView!
    @IBOutlet weak var exchangeRateStackkView: UIStackView!
    
    @IBOutlet weak var smallestUnitLabel: UILabel!
    
    @IBOutlet weak var largestUnitLabel: UILabel!
    
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
    
    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entityPickerView.delegate = self
        entityPickerView.dataSource = self
        exchangeRateStackkView.isHidden = true
        if let menu = menu {
            if menu.menuChoice == .Characters {
                setFieldNamesForCharacters()
                costStackView.isHidden = true
                
            } else {
                setFieldNamesForVehicles()
                costStackView.isHidden = false
            }
        }
        loadPickerData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    // MARK: - Table view data source
    
    // actions
    @IBAction func convertBackToCredits(_ sender: Any) {
        cost = .Credits
        exchangeRateStackkView.isHidden = true
        UsdButton.isEnabled = true
        CreditButton.isEnabled = false
        swtichUsdAndCreditColor()
        do {
            try switchFromCreditsToUsd()
            
        } catch InputError.BelowZero {
            
        } catch InputError.invalidData{
            
        }catch{
            print("unown error")
        }
        exchangeRateStackkView.isHidden = true
        
    }
    
    @IBAction func convertToUsd(_ sender: Any) {
        exchangeRateStackkView.isHidden = false
        UsdButton.isEnabled = false
        CreditButton.isEnabled = true
        swtichUsdAndCreditColor()
        
    }
    
    @IBAction func confirmExchangeRate(_ sender: Any) {
        cost = .USD
        do {
            try switchFromCreditsToUsd()
            
        } catch InputError.BelowZero {
            
            showAlert(title: "InputError", message: "please enter a number above 0")
            
        } catch InputError.invalidData{
            showAlert(title: "InputError", message: "please enter a numbers only")
        }catch{
            print("unown error")
        }
        exchangeRateStackkView.isHidden = true
    }
    
    @IBAction func convertLengthOrHeight(_ sender: Any) {
        
        self.lengthAndHeight = .Inches
        
        convertToInches()
        self.EnglishButton.isEnabled = false
        swtichEnglishAndMetricColor()
        self.MetricButton.isEnabled = true
        
    }
    
    
    @IBAction func convertBackToMetric(_ sender: Any) {
        self.lengthAndHeight = .Meters
        
        convertToInches()
        self.EnglishButton.isEnabled = true
        self.MetricButton.isEnabled = false
        swtichEnglishAndMetricColor()
        
        
        
    }
    
    //helper
    
    func displayBiggestAndSmallest(for entity: MenuTableViewController.MenuSelection){
        if let menu = menu{
            
            switch entity {
            case .Characters:
                smallestUnitLabel.text = menu.heros.first?.name
                largestUnitLabel.text = menu.heros.last?.name
                
            case .Vehicles:
                smallestUnitLabel.text =  menu.vehicles.first?.name
                largestUnitLabel.text = menu.vehicles.last?.name
            case .Starships:
                smallestUnitLabel.text = menu.starships.first?.name
                largestUnitLabel.text = menu.starships.last?.name
            }
            
            
        }
        
    }
    
    
    func showAlert(title:String,message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController,animated: true, completion: nil)
        
    }
    
    func setFieldNamesForCharacters(){
        self.infoLabel1.text = "Born"
        self.infoLabel2.text = "Home"
        self.infoLabel3.text = "Height"
        self.infoLabel4.text = "Eyes"
        self.infoLabel5.text = "Hair"
    }
    
    func setFieldNamesForVehicles(){
        self.infoLabel1.text = "Make"
        self.infoLabel2.text = "Cost:"
        self.infoLabel3.text = "length:"
        self.infoLabel4.text = "Class:"
        self.infoLabel5.text = "Crew:"
    }
    
    func swtichEnglishAndMetricColor() {
        let color = self.EnglishButton.currentTitleColor
        
        self.EnglishButton.setTitleColor(self.MetricButton.currentTitleColor, for: .normal)
        self.MetricButton.setTitleColor(color, for: .normal)
    }
    
    func swtichUsdAndCreditColor() {
        let color = self.UsdButton.currentTitleColor
        
        self.UsdButton.setTitleColor(self.CreditButton.currentTitleColor, for: .normal)
        self.CreditButton.setTitleColor(color, for: .normal)
    }
    
    
}

extension InfomationTableViewController : UIPickerViewDelegate ,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return   1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if let menu = self.menu {
            switch menu.menuChoice {
            case .Characters :
                return menu.heros.count
            case .Vehicles:
                return menu.vehicles.count
            case .Starships:
                return menu.starships.count
            }
            
        }
        
        return 0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let menu = self.menu {
            switch menu.menuChoice {
            case .Characters :
                let heroViewModel = CharatcerViewModel(character: menu.heros[row])
                
                update(title: heroViewModel.name, info1: heroViewModel.born, info2: heroViewModel.home, info3: String(heroViewModel.height), info4: heroViewModel.eyes, info5: heroViewModel.hair)
                do {
                    try switchFromCreditsToUsd()
                    
                } catch InputError.BelowZero {
                    
                    showAlert(title: "InputError", message: "please enter a number above 0")
                    
                } catch InputError.invalidData{
                    showAlert(title: "InputError", message: "please enter a numbers only")
                }catch{
                    print("unown error")
                }
                convertToInches()
                
                exchangeRateStackkView.isHidden = true
            case .Vehicles:
                let vehicleViewModel = VehicleViewModel(vehicle: menu.vehicles[row])
                
                update(title: vehicleViewModel.name, info1: vehicleViewModel.make, info2: String(vehicleViewModel.cost), info3: String(vehicleViewModel.length), info4: vehicleViewModel.vClass, info5: vehicleViewModel.crew)
                
                do {
                    try switchFromCreditsToUsd()
                    
                } catch InputError.BelowZero {
                    
                    showAlert(title: "InputError", message: "please enter a number above 0")
                    
                } catch InputError.invalidData{
                    showAlert(title: "InputError", message: "please enter a numbers only")
                }catch{
                    print("unown error")
                }
                convertToInches()
                exchangeRateStackkView.isHidden = true
            case .Starships:
                let starshipViewModel = StarshipViewModel(starship: menu.starships[row])
                
                update(title: starshipViewModel.name, info1: starshipViewModel.make, info2: String(starshipViewModel.cost), info3: String(starshipViewModel.length), info4: starshipViewModel.sClass, info5: starshipViewModel.crew)
                
                do {
                    try switchFromCreditsToUsd()
                    
                } catch InputError.BelowZero {
                    
                    showAlert(title: "InputError", message: "please enter a number above 0")
                    
                } catch InputError.invalidData{
                    showAlert(title: "InputError", message: "please enter a numbers only")
                }catch{
                    print("unown error")
                }
                convertToInches()
                exchangeRateStackkView.isHidden = true
            }
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if let menu = self.menu {
            switch menu.menuChoice {
            case .Characters :
                return menu.heros[row].name
            case .Vehicles:
                return menu.vehicles[row].name
            case .Starships:
                return menu.starships[row].name
            }
        }
        return "Data retirval error"
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
    
    func convertToInches()  {
        
        switch menu!.menuChoice {
        case .Vehicles:
            if lengthAndHeight == .Inches {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let heroViewModel = VehicleViewModel(vehicle: menu!.vehicles[row])
                self.infoAnswer3.text = "\( String(format: "%.2f", heroViewModel.length * 39.37 )) inches"
                
            } else {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let heroViewModel = VehicleViewModel(vehicle: menu!.vehicles[row])
                self.infoAnswer3.text = "\(heroViewModel.length) M"
                
            }
            
        case .Characters:
            if lengthAndHeight == .Inches {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let heroViewModel = CharatcerViewModel(character: menu!.heros[row])
                self.infoAnswer3.text = "\(String(format: "%.2f", heroViewModel.height / 2.54 ) ) inches"
                
            } else {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let heroViewModel = CharatcerViewModel(character: menu!.heros[row])
                self.infoAnswer3.text = "\(heroViewModel.height) cm"
                
            }
        case .Starships:
            if lengthAndHeight == .Inches {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let heroViewModel = StarshipViewModel(starship: menu!.starships[row])
                self.infoAnswer3.text = "\(String(format: "%.2f", heroViewModel.length * 39.37 )) inches"
                
            } else {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let heroViewModel = StarshipViewModel(starship: menu!.starships[row])
                self.infoAnswer3.text = "\(heroViewModel.length) M"
                
            }
            
        }
        
    }
    
    
    func switchFromCreditsToUsd() throws  {
        
        switch menu!.menuChoice {
        case .Characters:
            break
            
        case .Vehicles:
            if cost == .USD {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let vehicleViewModel = VehicleViewModel(vehicle: menu!.vehicles[row])
                guard let rate = Double(self.exchangeRateTextField.text!) else {
                    throw InputError.invalidData
                }
                
                
                if rate <= 0 {
                    throw InputError.BelowZero
                }else{
                    self.infoAnswer2.text = "\(String(format: "%.2f", vehicleViewModel.cost * rate )) USD"
                }
                
                
            } else {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let vehicleViewModel = VehicleViewModel(vehicle: menu!.vehicles[row])
                self.infoAnswer2.text = "\(vehicleViewModel.cost) Cr"
                
            }
        case .Starships:
            if cost == .USD {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let starshipViewModel = StarshipViewModel(starship: menu!.starships[row])
                guard let rate = Double(self.exchangeRateTextField.text!) else {
                    throw InputError.invalidData
                }
                
                if rate <= 0 {
                    throw InputError.BelowZero
                }else{
                    self.infoAnswer2.text = "\(String(format: "%.2f", starshipViewModel.cost * rate) ) USD"
                }
                
                
                
                
            } else {
                let row = self.entityPickerView.selectedRow(inComponent: 0)
                let starshipViewModel = StarshipViewModel(starship: menu!.starships[row])
                self.infoAnswer2.text = "\(starshipViewModel.cost) Cr"
                
            }
        }
        
    }
    
    
    // helper
    
    func loadPickerData(){
        if let menu = self.menu {
            
            switch menu.menuChoice {
                
            case .Characters:
                if menu.heros.count == 0 {
                    
                    
                    menu.client.getCharatcers(){  heroPage , error in
                        DispatchQueue.main.async {
                            self.group.enter()
                            if let someheros = heroPage {
                                menu.heroPage = someheros
                                menu.heros += someheros.results
                                menu.heros.sort()
                                self.group.leave()
                                self.group.enter()
                                for index in 0..<menu.heros.count {
                                    print("\(index)")
                                    menu.client.getCharacterHomeland(from: menu.heros[index].homeworld){
                                        homeworld , error in
                                        DispatchQueue.main.async {
                                            menu.heros[index].setHomeWorld(homeworld: homeworld ?? "cannot retrive Homeland")
                                        }
                                        
                                    }
                                    
                                    
                                }
                                self.group.leave()
                                
                            }
                            if let e = error {
                                print (e.localizedDescription)
                            }
                            
                            self.group.enter()
                            self.entityPickerView.reloadAllComponents()
                            self.displayBiggestAndSmallest(for: .Characters)
                            self.group.leave()
                            
                        }
                        
                    }
                    
                } else {
                    self.displayBiggestAndSmallest(for: .Characters)
                    
                }
                break
                
            case .Vehicles:
                
                if menu.vehicles.count == 0 {
                    
                    
                    menu.client.getVehicles(){  vehicles , error in
                        DispatchQueue.main.async {
                            
                            if let vehicles = vehicles {
                                menu.vehicles = vehicles
                                menu.vehicles.sort()
                                
                            }
                            if let e = error {
                                print (e.localizedDescription)
                            }
                            
                            
                            self.entityPickerView.reloadAllComponents()
                            self.displayBiggestAndSmallest(for: .Vehicles)
                        }
                        
                    }
                    
                }else {
                    self.displayBiggestAndSmallest(for: .Vehicles)
                    
                }
                break
            case .Starships:
                if menu.starships.count == 0 {
                    
                    
                    menu.client.getStarships(){  starships , error in
                        DispatchQueue.main.async {
                            
                            if let starships = starships {
                                menu.starships = starships
                                menu.starships.sort()
                                
                            }
                            if let e = error {
                                print (e.localizedDescription)
                            }
                            self.entityPickerView.reloadAllComponents()
                            self.displayBiggestAndSmallest(for: .Starships)
                        }
                        
                    }
                    
                }else {
                    self.displayBiggestAndSmallest(for: .Starships)
                    
                }
                break
                
            }
            
            
        }
        
    }
    
    
}
