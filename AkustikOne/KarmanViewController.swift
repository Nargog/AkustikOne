//
//  KarmanViewController.swift
//  AkustikOne
//
//  Created by Mats Hammarqvist on 2016-03-17.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import UIKit

class KarmanViewController: UIViewController {
    
    let frekvensFromVindhastighet = Struktur(getFrekvensFromVindhastighet: 6, namn: "standard", diameter: 1, theObjectIsCylindrical: true)
    
    let vindhastighetFromFrekvens = Struktur(getVindhastighetFromFrekvens: 100, namn: "standard", diameter: 1, theObjectIsCylindrical: true)
    
  //  var test = Struktur(getFrekvensFromVindhastighet: 100.0, namn: "test", diameter: 0.3, theObjectIsCylindrical: true)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBOutlet weak var txtFrekvens: UITextField!
    
    @IBOutlet weak var txtKonstruktionNamn: UITextField!
    
    @IBOutlet weak var txtVindHastighet: UITextField!
    
    @IBOutlet weak var txtDiameter: UITextField!
    
    @IBAction func switchFromFrekToVindh(_ sender: UISwitch) {
        if sender.isOn {
            print("ON switch")
        } else {
            print("OFF switch")
        }
    }
   
    @IBAction func btnIsCylindrical(_ sender: UISwitch) {
    }

    
    @IBAction func btnCalculate(_ sender: UIButton) {
        // calculate()
    }
   
    
    
        
    }
    
    
