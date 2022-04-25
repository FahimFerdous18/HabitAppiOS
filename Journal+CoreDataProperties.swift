//
//  Journal+CoreDataProperties.swift
//  
//
//  Created by BJIT on 1/28/22.
//
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var emoji: String?
    @NSManaged public var text: String?
    @NSManaged public var image: Data?
    @NSManaged public var details: String?
    @NSManaged public var date: Date?

}
