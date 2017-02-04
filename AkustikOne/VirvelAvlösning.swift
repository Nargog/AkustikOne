//
//  VirvelAvlösning.swift
//  AkustikOne
//
//  Created by Mats Hammarqvist on 13/03/16.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import Foundation

class XReynoldsTal {
     let apa = 12.0
}


class XStruktur {
    
    var namn: String
    var frekvens: Double
    let diameter: Double
    var strouhalsTal: Double
    var vindHastighet: Double
    let theObjectIsCylindrical: Bool
    
    let typStruktur: [String: Double] = ["long rectangular/prismatic": 0.15 , "long cylindric": 0.18]
    //let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
    
    
    init (getVindhastighetFromFrekvens frekvens:Double, namn:String, diameter:Double, theObjectIsCylindrical: Bool ){
        self.namn = namn
        self.frekvens = frekvens
        self.diameter = diameter
        if (theObjectIsCylindrical) {
            self.strouhalsTal = 0.18
        } else {
            self.strouhalsTal = 0.15
        }
        self.vindHastighet = frekvens * diameter / self.strouhalsTal
        print(self.strouhalsTal)
        self.theObjectIsCylindrical = theObjectIsCylindrical
    }
    
    init (getFrekvensFromVindhastighet vindHastighet:Double, namn:String, diameter:Double, theObjectIsCylindrical: Bool ){
        self.namn = namn
        self.vindHastighet = vindHastighet
        self.diameter = diameter
        if (theObjectIsCylindrical) {
            self.strouhalsTal = 0.18
        } else {
            self.strouhalsTal = 0.15
        }
        self.frekvens = vindHastighet * self.strouhalsTal / diameter
        print(self.strouhalsTal)
        self.theObjectIsCylindrical = theObjectIsCylindrical
    }
}
