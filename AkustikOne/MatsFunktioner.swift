//
//  MatsFunktioner.swift
//  AkustikOne
//
//  Created by Mats Hammarqvist on 2016-10-13.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import Foundation

// precedencegroup ExponentiativePrecedence {}

precedencegroup ExponentiativePrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiativePrecedence
public func ** (radix: Double, power: Double) -> Double {
    return pow((radix), (power))
}
