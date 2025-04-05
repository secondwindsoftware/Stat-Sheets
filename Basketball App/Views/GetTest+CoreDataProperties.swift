//
//  GetTest+CoreDataProperties.swift
//  
//
//  Created by Len Springs
//
//

import Foundation
import CoreData


extension GetPlayer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GetPlayer> {
        return NSFetchRequest<GetPlayer>(entityName: "Player")
    }

    @NSManaged public var srno: String?
    @NSManaged public var name: String?
    @NSManaged public var min: String?
    @NSManaged public var fgm_a: String?
    @NSManaged public var tpm_a: String?
    @NSManaged public var ftm_a: String?
    @NSManaged public var oreb: String?
    @NSManaged public var dreb: String?
    @NSManaged public var reb: String?
    @NSManaged public var ast: String?
    @NSManaged public var stl: String?
    @NSManaged public var blk: String?
    @NSManaged public var to: String?
    @NSManaged public var pf: String?
    @NSManaged public var pts: String?
    @NSManaged public var data: String?
    
}

