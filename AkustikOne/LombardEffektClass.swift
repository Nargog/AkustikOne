//
//  LombardEffektClass.swift
//  lombardEffektApp
//
//  Created by Mats Hammarqvist on 22/11/15.
//  Copyright © 2015 NeatApp. All rights reserved.
//

import Foundation


class LombardEffect {
    var roomVolume: Double = 0.0
    var F_FinalLprev: Double
    var B_BaseRestingVoiceLevel: Double // 60 0 70 dBA
    var S_MaskingLevelStartingLombard: Double
    var L_LombardCoefficient: Double {
        set {
            uppdate
        }
        get {
            return L_LombardCoefficient
        }
    }
    var N_NumberOfSpeakers: Double
    var V_RoomVolume: Double
    var T_ReverbTime: Double
    
    func uppdate(){
        
    }
    
    init (){
        self.F_FinalLprev = 50
        self.B_BaseRestingVoiceLevel = 60
        self.S_MaskingLevelStartingLombard = 40
        self.L_LombardCoefficient = 15
        self.N_NumberOfSpeakers = 1
        self.V_RoomVolume = 30
        self.T_ReverbTime = 0.5
    }
    
}

//  http://media.mats.hammarqvist.eu/2015/11/LombardFormula.png

