//
//  ViewController.swift
//  LjudKylFrys
//
//  Created by Mats Hammarqvist on 2015-10-04.
//  Copyright © 2015 Mats Hammarqvist. All rights reserved.
//

import UIKit

class KylViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var txtLjudEffekt: UITextField!
    
    
    @IBAction func btnInbyggdMaskin(_ sender: Any) {
        room.isHardRoom = !room.isHardRoom
    }

    @IBAction func btnRoomFurnitured(_ sender: Any) {
    }
}


var room = RoomProp()

