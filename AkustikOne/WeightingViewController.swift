//
//  WeightingViewController.swift
//  arsle
//
//  Created by Mats Hammarqvist on 2016-03-05.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import UIKit

class WeightingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lblCWeight: UILabel!
    @IBOutlet weak var lblAweight: UILabel!
    @IBOutlet weak var txtFrekvens: UITextField!

    @IBAction func calculateAWeightAtFrekvens(sender: AnyObject) {
        let tempText: NSString = txtFrekvens.text! as NSString
        let frequency: Double = tempText.doubleValue
        
       // lblAweight.text = "\(aWeightAtFrequency(frequency)) Hz"
        
        
        lblAweight.text = String(format: "%.1f", aWeightAtFrequency(frequency: frequency)) + " dB"
         lblCWeight.text = String(format: "%.1f", cWeightAtFrequency(frequency: frequency)) + " dB"
    }
}


