//
//  Reduktion.swift
//  calculateRw
//
//  Created by Mats Hammarqvist on 2015-09-21.
//  Copyright © 2015 Mats Hammarqvist. All rights reserved.
//

import Foundation

struct ReductionSoundSpectras {
    let frekvenser: [String] = ["50","63","80","100","125","160","200","250","315","400","500","630","800","1000","1250","1600","2000","2500","3150","4000","5000"]
    let referenceValues100_3150: [Double] = [0,0,0,33,36,39,42,45,48,51,52,53,54,55,56,56,56,56,56,0,0]
    let soundLevelSpectraC100_3150: [Double] = [0,0,0,-29,-26,-23,-21,-19,-17,-15,-13,-12,-11,-10,-9,-9,-9,-9,-9,0,0]
    let soundLevelSpectraCtr100_3150: [Double] = [0,0,0,-20,-20,-18,-16,-15,-14,-13,-12,-11,-9,-8,-9,-10,-11,-13,-15,0,0]
    
    let soundLevelSpectraCtr50_3150: [Double] = [-25,-23,-21,-20,-20,-18,-16,-15,-14,-13,-12,-11,-9,-8,-9,-10,-11,-13,-15,-16,-18]
    let soundLevelSpectraC50_3150: [Double]=[-40,-36,-33,-29,-26,-23,-21,-19,-17,-15,-13,-12,-11,-10,-9,-9,-9,-9,-9]
    
    let soundLevelSpectraC50_5000: [Double]=[-41,-37,-34,-30,-27,-24,-22,-20,-18,-16,-14,-13,-12,-11,-10,-10,-10,-10,-10,-10,-10]
    let soundLevelSpectraCtr50_5000: [Double] = [-25,-23,-21,-20,-20,-18,-16,-15,-14,-13,-12,-11,-9,-8,-9,-10,-11,-13,-15,-16,-18]
    

    
}


struct ImpactSoundSpectras {
    let frekvenser: [String] = ["20","25","31,5","40","50","63","80","100","125","160","200","250","315","400","500","630","800","1000","1250","1600","2000","2500","3150","4000","5000"]
    let referenceValues100_3150: [Double] = [0,0,0,0,0,0,0,62,62,62,62,62,62,61,60,59,58,57,54,51,48,45,42,0,0]
  
    let soundLevelSpectraC20_2500: [Double] = [ -7,-9,-11,-13,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-14,-13,-12,-11,-10,-9,-8,-7,0,0,0]
}

enum frekvensSpann {
    case intervall50_3150,intervall100_3150,intervall50_5000, intervall20_2500
}
//MARK: Ta fram värden i en sträng med separatorer . Decimalpunkt !!
func utvärdera (_ textBoxIn: NSString) -> [NSString]{
    
    let separatorCharacters = ":,;/!\n\r"
    
    let test = textBoxIn.components (separatedBy: CharacterSet(charactersIn:  separatorCharacters))
    
return test as [NSString]
    
}

//MARK: Stegljud

class StegLjud {
    
    var impactSoundSpectras = ImpactSoundSpectras()
    
    
    var lnValues: [Double] = [0,0,0,0] // Lnw CI CI50-2500, CI20-2500
    
    var evaluatedSpectra: [Double]?{
        didSet{
            calculateValues()
        }
    }
    
    func calculateValues() {
    var tempLnSum: Double = 100
    var weightingKorr: Double = 50
    var tempImpactWeighting100_3150: [Double] = impactSoundSpectras.referenceValues100_3150
        
        //MARK: ta reda på Ln100-3150
        repeat {
            weightingKorr = weightingKorr - 1 //Skifta kurvan med 1 dB
            // spektra från 100-3150 Hz
            for index in 3...impactSoundSpectras.referenceValues100_3150.count - 3 {
                
                if evaluatedSpectra![index]  >  impactSoundSpectras.referenceValues100_3150[index] + weightingKorr{
                    tempImpactWeighting100_3150[index] = 0.0
                } else {
                    tempImpactWeighting100_3150[index] =  impactSoundSpectras.referenceValues100_3150[index] + weightingKorr - evaluatedSpectra![index]
                    
                }
                
            }
            
            tempLnSum = tempImpactWeighting100_3150.reduce(0,{$0 + $1}) //Summera värden större än noll
            lnValues[0] = 52 + weightingKorr // sätter Rw - här behöver vi justera
            
        } while tempLnSum > 10 // här behöver vi justera
    }
    
}


class Reduktion {
    let reductionSoundSpectras = ReductionSoundSpectras()
    var rWValues: [Double] = [0,0,0,0,0,0,0] //Rw C Ctr C50-3150 Ctr50-3150 C50-5000 Ctr50-5000
    var currentFrekvensSpann: frekvensSpann = frekvensSpann.intervall50_5000
    
    var evaluatedSpectra: [Double]? {
        didSet{
            calculateValues()
        }
    }
    
    func calculateValues()  {
        
        var sumDiffLoggC50_3150: Double = 0
        var sumDiffLoggCtr50_3150: Double = 0
        var sumDiffLoggC100_3150: Double = 0
        var sumDiffLoggCtr100_3150: Double = 0
        var sumDiffLoggCtr50_5000: Double = 0
        var sumDiffLoggC50_5000: Double = 0
        //------
        var tempRwSum: Double = 100
        var weightingKorr: Double = 50
        var tempWeighting100_3150: [Double] = reductionSoundSpectras.referenceValues100_3150
        
        
        
        //MARK: ta reda på Rw100-3150
        repeat {
            weightingKorr = weightingKorr - 1 //Skifta kurvan med 1 dB
            // spektra från 100-3150 Hz
            for index in 3...reductionSoundSpectras.referenceValues100_3150.count - 3 {
             
                if evaluatedSpectra![index]  >  reductionSoundSpectras.referenceValues100_3150[index] + weightingKorr{
                    tempWeighting100_3150[index] = 0.0
                } else {
                    tempWeighting100_3150[index] =  reductionSoundSpectras.referenceValues100_3150[index] + weightingKorr - evaluatedSpectra![index]
                    
                }
            
            }
            
            tempRwSum = tempWeighting100_3150.reduce(0,{$0 + $1}) //Summera värden större än noll
            rWValues[0] = 52 + weightingKorr // sätter Rw
            
        } while tempRwSum > 32
        
        
        for index in 0...reductionSoundSpectras.referenceValues100_3150.count - 1 {
            
        //MARK:  Korrektionstermer För index 50 - 3150 Hz
        
            if index < reductionSoundSpectras.referenceValues100_3150.count - 3 {
                if currentFrekvensSpann == .intervall50_3150 || currentFrekvensSpann == .intervall50_5000 {
                    
                    
                    sumDiffLoggC50_3150 += pow(10,(reductionSoundSpectras.soundLevelSpectraC50_3150[index] - evaluatedSpectra![index])/10)
                    sumDiffLoggCtr50_3150 += pow(10,(reductionSoundSpectras.soundLevelSpectraCtr50_3150[index] - evaluatedSpectra![index])/10)
                }
                
                //MARK: För 100-3150 Hz
                if index >= 3 {
                    sumDiffLoggC100_3150 += pow(10,(reductionSoundSpectras.soundLevelSpectraC100_3150[index] - evaluatedSpectra![index])/10)
                    sumDiffLoggCtr100_3150 += pow(10,(reductionSoundSpectras.soundLevelSpectraCtr100_3150[index] - evaluatedSpectra![index])/10)
                }
            }
            
        //MARK: För 50-5000 Hz
            if currentFrekvensSpann == .intervall50_5000 {
                sumDiffLoggC50_5000 += pow(10,(reductionSoundSpectras.soundLevelSpectraC50_5000[index] - evaluatedSpectra![index])/10)
                sumDiffLoggCtr50_5000 += pow(10,(reductionSoundSpectras.soundLevelSpectraCtr50_5000[index] - evaluatedSpectra![index])/10)
            }
            
        }

//MARK: Tilldela korrektionstermer
        rWValues[1] = -(rWValues[0] + 10 * log10(sumDiffLoggC100_3150))
        rWValues[2] = -(rWValues[0] + 10 * log10(sumDiffLoggCtr100_3150))
        
        if currentFrekvensSpann == .intervall50_3150 || currentFrekvensSpann == .intervall50_5000 {
            rWValues[3] = -(rWValues[0] + 10 * log10(sumDiffLoggC50_3150))
            rWValues[4] = -(rWValues[0] + 10 * log10(sumDiffLoggCtr50_3150))
        }
           if currentFrekvensSpann == .intervall50_5000 {
            rWValues[5] = -(rWValues[0] + 10 * log10(sumDiffLoggC50_5000))
            rWValues[6] = -(rWValues[0] + 10 * log10(sumDiffLoggCtr50_5000))
        }
 //MARK: Debugging skriv ut värden på konsolen
        for rWValuesInt in rWValues{
            print(Int(round(rWValuesInt)))
        }
        
        print(tempRwSum)
      
    }
    
}



