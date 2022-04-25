//
//  SaveInfo+CoreDataProperties.swift
//  EasyHabit
//
//  Created by BJIT on 1/25/22.
//
//

import Foundation
import CoreData


extension SaveInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SaveInfo> {
        return NSFetchRequest<SaveInfo>(entityName: "SaveInfo")
    }

    @NSManaged public var img: Data?
    @NSManaged public var text: String?
    @NSManaged public var date: String?

}

extension SaveInfo : Identifiable {

}
