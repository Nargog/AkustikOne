//
//  BalkResonanser.swift
//  NyBalkResonans
//
//  Created by Mats Hammarqvist on 2016-01-20.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import Foundation
//import MatsFunktioner.swift


/*precedencegroup ExponentiativePrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiativePrecedence
public func ** (radix: Double, power: Double) -> Double {
    return pow((radix), (power))

    
}

*/

class ResonansFrekvenser {
    /*
    =M8*ROT(($C$4*$C$5)/($C$6*$C$7^4))/(2*PI())
    
    E-Modul	E	1
    Tröghetsmoment I	I	6,39E+07	Ec_dyn/Ec_ek :	1,2
    massa per meter	m	4,11E+02	Pågjutning :	0,05
    balklängd l	L	10
    
    Egenvärde	ω_n		4
    n=1	n=2	n=3	n
    0	22,37	61,67	120,9026539
    0	55,93	30,23	74,63888328
    0	15,42	49,97	104,2476965
    0	9,872	39,48	88,82643961
    2,468	22,2	61,69	120,9026539
    3,516	22,03	61,7	120,9026539
    9,872	39,48	88,83	157,9136704
    15,42	49,97	104,2	178,2697295
    5,593	30,23	74,63	138,7913119
    22,37	61,67	120,9	199,8594891
    
    
    */
    
    
    
    
    var balkI_moment : Double = 6.39e7
    var balkMassa : Double = 4.11e2
    
    var balkLengthBalk : Double = 10.0
    var balkEModul = 1.0
    var test: Double = 0 // Bara för att testa
    
    let egenvärde = [
        EgenVärde (elementarFall: "No Case",w:[0,0,0,0,0]),
        EgenVärde (elementarFall: "Fall 1",w:[0,0,22.37,61.67,120.902653913345]),
        EgenVärde (elementarFall: "Fall 2",w:[0,0,55.93,30.23,74.6388832832383]),
        EgenVärde (elementarFall: "Fall 3",w:[0,0,15.42,49.97,104.247696486506]),
        EgenVärde (elementarFall: "Fall 4",w:[0,0,9.872,39.48,88.8264396098042]),
        EgenVärde (elementarFall: "Fall 5",w:[0,2.468,22.2,61.69,120.902653913345]),
        EgenVärde (elementarFall: "Fall 6",w:[0,3.516,22.03,61.7,120.902653913345]),
        EgenVärde (elementarFall: "Fall 7",w:[0,9.872,39.48,88.83,157.91367041743]),
        EgenVärde (elementarFall: "Fall 8",w:[0,15.42,49.97,104.2,178.269729494677]),
        EgenVärde (elementarFall: "Fall 9",w:[0,5.593,30.23,74.63,138.791311890319]),
        EgenVärde (elementarFall: "Fall 10",w:[0,22.37,61.67,120.9,199.85948912206])]
    
    
    func calculate (){
        //test = egenvärde[10].w[1] * pow(((balkEModul * balkI_moment)/(balkMassa * pow(balkLengthBalk,4))),0.5)/(2 * 3.141)
        
        
        test = egenvärde[10].w[1] * ((balkEModul * balkI_moment / balkMassa * balkLengthBalk ** 4) ** 0.5) / (2 * 3.14159)
    }
    
    
    func resultat()-> Double {
        calculate()
        return test
        
    }
    
}



/*
Egenvärde	ω_n
n=0 (dummy) n=1	n=2	n=3	n=4
*/
struct EgenVärde {
    var elementarFall:String
    var w:[Double]
    
}
