//
//  MatsBasFunktioner.swift
//  AkustikOne
//
//  Created by Mats Hammarqvist on 13/03/16.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import Foundation

//MARK: - Funktion för exponent  x**y (pow(x,y)) -

/* Gammal 
 
 infix operator ** { associativity left precedence 160 }
func ** (left: Double, right: Double) -> Double {
    return pow(left, right)
    
}
*/

// precedencegroup ExponentiativePrecedence {}

precedencegroup ExponentiativePrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiativePrecedence
public func ** (radix: Double, power: Double) -> Double {
    return pow((radix), (power))
}

