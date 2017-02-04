//
//  BalkViewController.swift
//  NyBalkResonans
//
//  Created by Mats Hammarqvist on 2016-01-20.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import UIKit

class BalkViewController: UIViewController , UITextFieldDelegate{
    
    var balkMedResonanser = ResonansFrekvenser()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }

    @IBAction func calculateBalk(_ sender: AnyObject) {
        
        
        
        lblResultatVisning.text = " \(balkMedResonanser.resultat()) Hz"
    }

    @IBOutlet weak var txtEModul: UITextField!
    
    @IBOutlet weak var txtIModul: UITextField!
    @IBOutlet weak var txtMassaPerMeter: UITextField!
    @IBOutlet weak var txtBalkLängd: UITextField!
    @IBOutlet weak var lblResultatVisning: UILabel!
}

