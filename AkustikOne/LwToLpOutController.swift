//
//  LwToLpOutController.swift
//  Akustik
//
//  Created by Mats Hammarqvist on 2015-06-16.
//  Copyright (c) 2015 Mats Hammarqvist. All rights reserved.
//

import UIKit


class LwToLpOutController: UIViewController, UITextFieldDelegate {
    
    lazy var receiver = Receiver()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       txtLwa.delegate = self
        txtX.delegate = self
        txtY.delegate = self
        txtZ.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    // LW

    @IBOutlet weak var txtLwa: UITextField!

    @IBOutlet weak var lblLpa: UILabel!
    
    // Text input sändare
    
    @IBOutlet weak var txtX: UITextField!
    
    @IBOutlet weak var txtY: UITextField!
    
    @IBOutlet weak var txtZ: UITextField!
    
    // Text input mottagare
    
    @IBOutlet weak var txtXMottagare: UITextField!
    
    @IBOutlet weak var txtYMottagare: UITextField!
    
    @IBOutlet weak var txtZMottagare: UITextField!
    
    // resultat
    
    @IBOutlet weak var txtFieldResult: UITextView!
    
    @IBAction func btnClearSources(_ sender: AnyObject) {
        receiver.clearSources()
        lblLpa.text = "EMPTY"
        txtFieldResult.text = "EMPTY"
        
    }
    @IBAction func btnCalculateLPA(_ sender: UIButton) {
     
        
        
       
   // Lägg till en källa med position
       
        
        let LpWFloattext: NSString  = txtLwa.text! as NSString
        let LpWValue = LpWFloattext.floatValue 
        txtLwa.text = "\(LpWValue)"
        
       // let LpWValue = NSNumberFormatter().numberFromString(txtLwa.text!)!.floatValue
        
        
        let XsourceFloattext: NSString  = txtX.text! as NSString
        let sourceXValue = XsourceFloattext.floatValue
        txtX.text = "\(sourceXValue)"
        
        
        let YsourceFloattext: NSString  = txtY.text! as NSString
        let sourceYValue = YsourceFloattext.floatValue 
        txtY.text = "\(sourceYValue)"
        
        let ZsourceFloattext: NSString  = txtZ.text! as NSString
        let sourceZValue = ZsourceFloattext.floatValue 
        txtZ.text = "\(sourceZValue)"
        
        /*if let sourceXValueText = txtX.text {
            
            
            print("ok \(NSNumberFormatter().numberFromString((sourceXValueText))!.floatValue)")
                sourceXValue = NSNumberFormatter().numberFromString((sourceXValueText))!.floatValue }
            
         else {
            sourceXValue = 0
            print("fel")
        }
        
        let sourceYValue = NSNumberFormatter().numberFromString(txtY.text!)!.floatValue ?? 0
        let sourceZValue = NSNumberFormatter().numberFromString(txtZ.text!)!.floatValue ?? 0 */
        
        let sourcePosition = MHTPoint3D(x: sourceXValue, y: sourceYValue, z: sourceZValue)

     
        
        let sourceTemp = LpWSource(name: ("test \(index)"), position: sourcePosition, ljudEffekt: LpWValue)
       
        
        
        receiver.addSource(sourceTemp)
            
    // set position of receiver
        
        let XFloattext: NSString  = txtXMottagare.text! as NSString
        let receiverXValue = XFloattext.floatValue 
        txtXMottagare.text = "\(receiverXValue)"
        
        
        let YFloattext: NSString  = txtYMottagare.text! as NSString
        let receiverYValue = YFloattext.floatValue 
        txtYMottagare.text = "\(receiverYValue)"
        
        let ZFloattext: NSString  = txtZMottagare.text! as NSString
        let receiverZValue = ZFloattext.floatValue
        txtZMottagare.text = "\(receiverZValue)"
        
        /*let receiverXValue = NSNumberFormatter().numberFromString(txtXMottagare.text!)!.floatValue ?? 0
        let receiverYValue = NSNumberFormatter().numberFromString(txtYMottagare.text!)!.floatValue ?? 0
        let receiverZValue = NSNumberFormatter().numberFromString(txtZMottagare.text!)!.floatValue ?? 0 */
        
        let receiverPosition = MHTPoint3D(x: receiverXValue, y: receiverYValue, z: receiverZValue)
        
        receiver.receiverPosition = receiverPosition
        showResult()
    }
    
    
    func showResult (){
    
        
        lblLpa.text = "LpA är \(receiver.ljudNivå!) dBA ... \(receiver.sourcesToThisReceiver.count) källor"
        
        
        txtFieldResult.text = ""
        for tempSource in receiver.sourcesToThisReceiver {
            txtFieldResult.text = txtFieldResult.text + ("Lw = \(tempSource.ljudEffekt) dB // position: \(tempSource.position)\n")
        }
            
        }
        
   
    //MARK: prepare for segue
    
 /*   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as? UIViewController
        if let hvc = destination as? SourceTableViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "toSourceTabell": hvc.tableReceiver = receiver
                    default: hvc.tableReceiver = receiver
                }
                
            }
        }
        
    } */
    
        
        
    }
    


