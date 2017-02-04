//
//  KylFrysModel.swift
//  AkustikOne
//
//  Created by Mats Hammarqvist on 2016-02-03.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import Foundation




class RoomProp {
    var roomType : String
    var roomVolume : Double
    var roomEKT : Double//{
    //  get {
    //kolla om rummet är hårt
    //  }
    //}
    var isHardRoom : Bool // hard => ekt = 1 sek, not hard => ekt = 0,5 sek
    var korrektion: Double = 0
    var ljudNivåIRum : Double {
        get{
            korrektion = 0
            if (vitVara?.isInbyggt)!{
                
                korrektion = korrektion - 3
                // print("is inbyggt")
            }
            
            
            if (isHardRoom) {
                korrektion = korrektion + 3
                // print ("hard")
            }
            
            return vitVara!.ljudEffekt + korrektion - 10*log(0.16 * roomVolume / roomEKT)
        }
        
    }
    var vitVara : VitvaraProp?
    
    init () {
        self.roomType = "not set"
        self.roomVolume = 31
        self.roomEKT = 1
        self.isHardRoom = true
        
        //  self.vitVara = VitvaraProp
    }
    
    init (
        roomType : String,
        roomVolume : Double,
        roomEKT : Double,
        isHardRoom : Bool,
        vitVara : VitvaraProp) {
        self.roomType = roomType
        self.roomVolume = roomVolume
        self.roomEKT = roomEKT
        self.isHardRoom = isHardRoom
        
        self.vitVara = VitvaraProp(ljudEffekt: 50, isInbyggt: false, soundReduction: 0)
        
        
    }
}

//MARK Vitvara
class VitvaraProp {
    
    var ljudEffekt : Double
    var ljudEffektToRoom : Double
        {
        get
        {
            
            if isInbyggt {
                return ljudEffekt + soundReduction - 3
            } else {
                return ljudEffekt + soundReduction
            }
        }
    }
    
    var isInbyggt : Bool
    var soundReduction : Double
    
    init () {
        
        self.isInbyggt = false
        self.ljudEffekt = 0.0
        self.soundReduction = 0.0
        
        
    }
    
    init (
        ljudEffekt : Double,
        isInbyggt : Bool,
        soundReduction: Double) {
        
        self.isInbyggt = isInbyggt
        self.ljudEffekt = ljudEffekt
        self.soundReduction = soundReduction
        
        
    }
}


