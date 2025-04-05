//
//  ModelClass.swift
//  Basketball App
//
//  Created by Len Springs 

import Foundation

class PlayerModelClass : NSObject ,NSCoding,Codable {
    var SrNo = ""
    var Starter = ""
    var Min = ""
    var FGM_A = ""
    var TPM_A = ""
    var FTM_A = ""
    var OREB = ""
    var DREB = ""
    var REB = ""
    var AST = ""
    var STL = ""
    var BLK = ""
    var TO = ""
    var PF = ""
    var PTS = ""
    
    required init(
        SrNo : String,
        Starter : String,
        Min : String,
        FGM_A : String,
        TPM_A : String,
        FTM_A : String,
        OREB : String,
        DREB : String,
        REB : String,
        AST : String,
        STL : String,
        BLK : String,
        TO : String,
        PF : String,
        PTS : String
    ){
        self.SrNo = SrNo
        self.Starter = Starter
        self.Min = Min
        self.FGM_A = FGM_A
        self.TPM_A = TPM_A
        self.FTM_A = FTM_A
        self.OREB = OREB
        self.DREB = DREB
        self.REB = REB
        self.AST = AST
        self.STL = STL
        self.BLK = BLK
        self.TO = TO
        self.PF = PF
        self.PTS = PTS
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.SrNo = aDecoder.decodeObject(forKey: "SrNo") as! String
        self.Starter = aDecoder.decodeObject(forKey: "Starter") as! String
        self.Min = aDecoder.decodeObject(forKey: "Min") as! String
        self.FGM_A = aDecoder.decodeObject(forKey: "FGM_A") as! String
        self.TPM_A = aDecoder.decodeObject(forKey: "TPM_A") as! String
        self.FTM_A = aDecoder.decodeObject(forKey: "FTM_A") as! String
        self.OREB = aDecoder.decodeObject(forKey: "OREB") as! String
        self.DREB = aDecoder.decodeObject(forKey: "DREB") as! String
        self.REB = aDecoder.decodeObject(forKey: "REB") as! String
        self.AST = aDecoder.decodeObject(forKey: "AST") as! String
        self.STL = aDecoder.decodeObject(forKey: "STL") as! String
        self.BLK = aDecoder.decodeObject(forKey: "BLK") as! String
        self.TO = aDecoder.decodeObject(forKey: "TO") as! String
        self.PF = aDecoder.decodeObject(forKey: "PF") as! String
        self.PTS = aDecoder.decodeObject(forKey: "PTS") as! String
        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(SrNo, forKey: "SrNo")
        aCoder.encode(Starter, forKey: "Starter")
        aCoder.encode(Min, forKey: "Min")
        aCoder.encode(FGM_A, forKey: "FGM_A")
        aCoder.encode(TPM_A, forKey: "TPM_A")
        aCoder.encode(FTM_A, forKey: "FTM_A")
        aCoder.encode(OREB, forKey: "OREB")
        aCoder.encode(DREB, forKey: "DREB")
        aCoder.encode(REB, forKey: "REB")
        aCoder.encode(AST, forKey: "AST")
        aCoder.encode(STL, forKey: "STL")
        aCoder.encode(BLK, forKey: "BLK")
        aCoder.encode(TO, forKey: "TO")
        aCoder.encode(PF, forKey: "PF")
        
        aCoder.encode(PTS, forKey: "PTS")
    }
}
 
