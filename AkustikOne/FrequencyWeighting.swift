//
//  File.swift
//  arsle
//
//  Created by Mats Hammarqvist on 2016-03-05.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import Foundation




func aWeightAtFrequency (frequency: Double) -> Double {
    var aTaljare: Double
    var aRef:Double
    
    aTaljare = 12200 ** 2 * frequency ** 4 / ((frequency ** 2 + 20.6 ** 2) * (frequency ** 2 + 12200 ** 2) * (frequency ** 2 + 107.7 ** 2) ** 0.5 * (frequency ** 2 + 737.9 ** 2) ** 0.5)
    aRef = 12200 ** 2 * 1000 ** 4 / ((1000 ** 2 + 20.6 ** 2) * (1000 ** 2 + 12200 ** 2) * (1000 ** 2 + 107.7 ** 2) ** 0.5 * (1000 ** 2 + 737.9 ** 2) ** 0.5)
    return 20 * log10(aTaljare/aRef)
}


func cWeightAtFrequency (frequency: Double) -> Double {
    var cTaljare: Double
    var cRef:Double
    cTaljare = 12200 * frequency ** 2 / ((frequency ** 2 + 20.6 ** 2) * (frequency ** 2 + 12200 ** 2))
    cRef = 12200 * 1000 ** 2 / ((1000 ** 2 + 20.6 ** 2) * (1000 ** 2 + 12200 ** 2))
    return 20 * log10(cTaljare / cRef)
}


