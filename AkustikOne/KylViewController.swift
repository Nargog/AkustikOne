//
//  ViewController.swift
//  LjudKylFrys
//
//  Created by Mats Hammarqvist on 2015-10-04.
//  Copyright © 2015 Mats Hammarqvist. All rights reserved.
//

import UIKit

class KylViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        txtLjudEffekt.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(KylViewController.dismissKeyboard)))
       
        
      
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

 var userIsEnteringNumber = false
    
    func dismissKeyboard(){
        txtLjudEffekt.resignFirstResponder()
        room.vitVara?.ljudEffekt = Double(txtLjudEffekt.text!)!
        lblResult.text = String(room.ljudNivåIRum)
        userIsEnteringNumber = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtLjudEffekt.resignFirstResponder()
        userIsEnteringNumber = false
        return true
    }
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var txtLjudEffekt: UITextField!
    
    
    @IBAction func btnInbyggdMaskin(_ sender: Any) {
        room.isHardRoom = !room.isHardRoom
    }

    @IBAction func btnRoomFurnitured(_ sender: Any) {
    }
}


var room = RoomProp()

