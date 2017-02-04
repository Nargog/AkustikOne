//
//  ReduktionViewController.swift
//  calculateRw
//
//  Created by Mats Hammarqvist on 2015-09-21.
//  Copyright © 2015 Mats Hammarqvist. All rights reserved.
//

import UIKit

class ReduktionViewController: UIViewController, UITextViewDelegate {
    
   
    
    let spektra = [29.4,
        32.5,
        30.3,
        30.6,
        32.3,
        32.1,
        38.3,
        40.3,
        39.9,
        42.8,
        45.1,
        45.3,
        48.9,
        46.5,
        48.1,
        50.4,
        51.0,
        51.5,
        54.0]
    
    
    
    let spektra2 = [22.9,18.3,32.2,23.4,24.6,33.3,34,34.2,37.4,39.6,42.6,47.6,51,50.9,50.8,53.2,51.2,50.8,51.7,55.8,58.2]
    
    let spektra3 = [ 18.7,
        19.2,
        20.0,
        20.4,
        16.3,
        17.7,
        22.6,
        22.4,
        22.7,
        24.8,
        26.6,
        28.0,
        30.5,
        31.8,
        32.5,
        33.4,
        33.0,
        31.0,
        25.5,
        26.8,
        29.2]
    
    let spektra4 = [42.5, 48.6, 51.3, 51.0, 48.0, 49.8, 54.5, 48.7, 54.2, 57.7, 60.1, 62.4, 64.4, 66.4, 68.0, 71.4, 74.5, 74.2, 76.4, 76.0, 76.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
       inputRwTextField.delegate = self
    
       
       evaluateSpektra(spektra2, Error: "")
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    
    
    func getSpektra() -> ([Double], String) {
        var spektraTestDouble:[Double]=[]
        let inputRwValues: NSString = inputRwTextField.text as NSString? ?? ""
        let spektraTest = utvärdera(inputRwValues)
        //fyll ut
        if spektraTest.count == 21 {
        
        for index in 0...20{
            spektraTestDouble.append(spektraTest[index].doubleValue)
            print (" \(index) : \(spektraTestDouble[index]) ")
        }
        return (spektraTestDouble, "")
        } else {
            return  ([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], "fel antal frekvensvärden!!! ska vara 21 st")
        }
    }
    
    func evaluateSpektra(_ spektraIN:[Double], Error: String) {
    test.evaluatedSpectra = spektraIN
    test.currentFrekvensSpann = frekvensSpann.intervall100_3150
    
    
 //       resultLabelText.text = "\(Int(round(test.rWValues[0])))(\(Int(round(test.rWValues[1]))); \(Int(round(test.rWValues[2]))); \(Int(round(test.rWValues[3]))); \(Int(round(test.rWValues[4]))); \(Int(round(test.rWValues[5]))); \(Int(round(test.rWValues[6]))) ) dB  \(Error)"
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        
        return true
    }
    
 

    var test: Reduktion = Reduktion()
    

    @IBOutlet weak var inputRwTextField: UITextView! {
        didSet{
            print("test")
        }
    }
    
    @IBOutlet weak var resultLabelText: UILabel!
  

    @IBAction func calculateButton(_ sender: AnyObject) {
        
        evaluateSpektra(getSpektra().0,Error: getSpektra().1)
    }

}

