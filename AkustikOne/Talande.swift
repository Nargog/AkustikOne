//
//  Talande.swift
//  TalandeTest
//
//  Created by Mats Hammarqvist on 2016-04-20.
//  Copyright © 2016 Mats Hammarqvist. All rights reserved.
//

import Foundation

class Talande {
    
    var resultat: Double? {
        get{
            return ljudEffekt! + ReflexKorrektion(hasReflexYta: isThereReflektion!) - AvståndsKorrektion(avstånd: avstånd!) + AntalKorr(antal: antal!)
        }
    }
    var reflex: Double?
    var avstånd: Double?
    var antal: Double?
    var ljudEffekt: Double?
    var isThereReflektion: Bool?
    var röster = [röstStyrka]()
    
    
    struct röstStyrka {
        var description: String
        var LpWA: Double
    }
    
    init(){
    
    röster = [röstStyrka(description: "Viskning", LpWA: 38),
                   röstStyrka(description: "Normal röst", LpWA: 65),
                   röstStyrka(description: "Högröstat tal", LpWA: 70),
                   röstStyrka(description: "Mycket högröstat tal", LpWA: 75),
                   röstStyrka(description: "Normalt rop", LpWA: 80),
                   röstStyrka(description: "Rop (15 meter)", LpWA: 85),
                   röstStyrka(description: "Högt rop", LpWA: 95),
                   röstStyrka(description: "Normalt skrik", LpWA: 100),
                   röstStyrka(description: "Högt skrik", LpWA: 105),
                   röstStyrka(description: "Maximalt skrik", LpWA: 110),
                   röstStyrka(description: "Jill Drake WR", LpWA: 137)]
        
        avstånd = 10
        antal = 1
        ljudEffekt = 38
        isThereReflektion = true
    }
    
   
    
    convenience init (avstånd: Double, antal: Double, ljudEffekt: Double, isThereReflektion: Bool){
        self.init()
        self.avstånd = avstånd
        self.antal = antal
        self.ljudEffekt = ljudEffekt
        self.isThereReflektion = isThereReflektion
        
    }
    
    
    /* "Normal röst 65",
     "Högröstat tal 70",
     "Mycket högröstat tal 75",
     "Normalt rop 80",
     "Rop (15 meter) 85",
     "Högt rop 95",
     "Normalt skrik 100",
     "Högt skrik 105",
     "Maximalt skrik 110"]
     
     
     
     EKVIVALENTA LJUDNIVÅER
     
     Normal röst	65
     Högröstat tal	70
     Mycket högröstat tal	75
     @IBOutlet weak var switchGotReflex: UISwitch!
     Normalt rop	80
     Rop (15 meter) 85
     Högt rop 95 dBA
     Normalt skrik	100
     Högt skrik	105
     Maximalt skrik	110
     
     In einem Gerichtsgutachten des LfU Nr. 2/1-251-24/87, vom 25.01.1988, wurden folgende theoretischen Sprachschallpegel für einen Sprecher (LWA,1S) zugrundegelegt:
     normale Sprechweise 71 dB(A)
     gehobene Sprechweise  77 dB(A)
     sehr laute Sprechweise 83 dB(A)
     Schreien 87 dB(A)
     LWA,1S
     
     Sprechen,normal 65 dB(A)
     Sprechen,gehoben70 dB(A)
     Sprechen,sehr laut75 dB(A)
     Rufen,normal80 dB(A)
     Rufen,(Distanz 15m)85 dB(A)
     Rufen,laut 95 dB(A)
     Schreien 100 dB(A)
     Schreien,maximal110 dB(A)
     
     Världsrekord LwA = 137 dB(A), av Jill Drake
     http://news.bbc.co.uk/2/hi/uk_news/england/kent/3464755.stm
     
     Viskning ger enligt sida 30 dB(A) på 1 meter, osäkert värde!
     
     */
    
    func AntalKorr( antal:Double) -> Double {
        return 10*log10(antal)
    }
    
    func AvståndsKorrektion (avstånd: Double) -> Double{
        return 20*log10(avstånd/10)  + 28 // +28 pga skillnad mellan LpWA och LWA på vid halvsfärisk utb
    }
    
    func ReflexKorrektion (hasReflexYta: Bool) -> Double {
        if hasReflexYta {
            return 3
        } else {
            return 0
        }
    }
    
}
