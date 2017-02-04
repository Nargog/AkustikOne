//
//  modelAkustik.swift
//  Akustik
//
//  Created by Mats Hammarqvist on 2015-06-16.
//  Copyright (c) 2015 Mats Hammarqvist. All rights reserved.
//

import Foundation

struct MHTPoint3D {
    var x:Float
    var y:Float
    var z:Float
    
    init(){
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
    }
    
    
    init(x: Float, y:Float, z:Float){
        self.x = x
        self.y = y
        self.z = z
    }
    
}


class LpWSource {
    var position = MHTPoint3D(x: 0, y: 0, z: 0)
    var ljudEffekt: Float
    var name: String
    
    init (name: String, position:MHTPoint3D, ljudEffekt: Float){
        self.position = position
        self.ljudEffekt = ljudEffekt
        self.name = name
    }
}




class Receiver {
    var receiverPosition = MHTPoint3D(x: 0.0, y: 0.0, z: 0.0)
    var sourcesToThisReceiver = [LpWSource]()
    
    var ljudNivå : Float?{
        get{
            
            var tempVar: Float = 0.0
            
            if sourcesToThisReceiver.count > 0 {
                for sourceNo in 0...(sourcesToThisReceiver.count - 1){
                    
                    var tempVarPerSource: Float = 0.0
                    
                    print(sourcesToThisReceiver[sourceNo].ljudEffekt)
                    print("SouceDistans: \(sourcesToThisReceiver[sourceNo].position) ")
                    print("receiverPosition \(receiverPosition)")
                    
                    tempVarPerSource = sourcesToThisReceiver[sourceNo].ljudEffekt - 20 * log10f(calcDistans(from: receiverPosition, to: sourcesToThisReceiver[sourceNo].position)/10)
                    
                    tempVar += pow(10, tempVarPerSource/10)
                    print("Lp \(tempVar): SourceNo \(sourceNo)")
                    
                }
                return  10 * log10f(tempVar) - 31
            } else {
                return nil
            }
        }
        
    }
    
    //var distans: Float = 0.0
    
    
    fileprivate func calcDistans (from punkt1: MHTPoint3D, to punkt2: MHTPoint3D)-> Float {
        let diffX2: Float = powf(punkt1.x - punkt2.x,2.0)
        let diffY2: Float = powf(punkt1.y - punkt2.y, 2.0)
        let diffZ2: Float = powf(punkt1.z - punkt2.z, 2.0)
        
        let distansTemp = powf(diffX2 + diffY2 + diffZ2, 0.5)
        
        return distansTemp
    }
    
    
    
    func addSource (_ lpWSource: LpWSource) {
        sourcesToThisReceiver.append(lpWSource)
    }
    
    func clearSources() {
        sourcesToThisReceiver.removeAll()
    }
    init (){
        self.receiverPosition = MHTPoint3D(x: 0, y: 0, z: 0)
    }
    
    init (position:MHTPoint3D){
        
        self.receiverPosition = position
        
        
    }
}
