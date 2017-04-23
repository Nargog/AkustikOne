//
//  TalandeViewController.swift
//  TalandeTest
//
//  Created by Mats Hammarqvist on 2016-04-19.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import UIKit

class TalandeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
  
    
   var röstStyrka = Talande()

    




   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        txtAntalPersoner.delegate = self
        txtAvståndMottagare.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        upDateAlles()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     @IBOutlet weak var txtAntalPersoner: UITextField!
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        upDateAlles()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UIPicker funktioner
    
 /*   func numberOfComponentsInPickerView( pickerView: UIPickerView) -> Int {
        return 1
    }
   */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return röstStyrka.röster.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return röstStyrka.röster[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let titleData = röstStyrka.röster[row].description
        let myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName: UIColor.red])
        
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        röstStyrka.ljudEffekt = röstStyrka.röster[row].LpWA
        print("value picked: ------\(String(describing: röstStyrka.ljudEffekt)) dBA")
        upDateAlles()
        
    }
    
    // Slut
    
    func upDateAlles() {
        // Beräknat resultat omräknat till LpA,10meter (-28 dB)
        
        // antal personer
        let AntalPersonertext: NSString  = txtAntalPersoner.text! as NSString
        röstStyrka.antal = AntalPersonertext.doubleValue 
        txtAntalPersoner.text = "\(röstStyrka.antal!)"
        
        // Avstånd
        
        
        let Avståndtext: NSString  = txtAvståndMottagare.text! as NSString
        röstStyrka.avstånd = Avståndtext.doubleValue 
        txtAvståndMottagare.text = "\(röstStyrka.avstånd!)"
 
      // print(String(format:"average temp. = %.2f", avgTemp))  // average temp. = 66.85
 
        
    
      print(NSString(format:"Ljudnivån i mottagaren är %.2f dBA", röstStyrka.resultat!))
        lblLjudnivåHosMottagare.text = NSString(format:"Ljudnivån i mottagaren är %.1f dBA", röstStyrka.resultat!) as String
    }
    
    
    
   
     
    
    @IBOutlet weak var txtAntalPersoner: UITextField!
    
    @IBOutlet weak var lblLjudnivåHosMottagare: UILabel!
    
    
    @IBOutlet weak var txtAvståndMottagare: UITextField!
    
    @IBOutlet weak var isMySwtchOn: UISwitch!
    
    @IBAction func switchReflexInWall(_ sender: UISwitch) {
    
   
        röstStyrka.isThereReflektion = isMySwtchOn.isOn
        
        upDateAlles()
        
            lblReflex.text = "Reflex i vägg (\(isMySwtchOn.isOn))"
        
        
    }
    
    
    @IBOutlet weak var lblReflex: UILabel!

    @IBOutlet weak var TestPicker: UIPickerView!

}

