//
//  Habit+CoreDataProperties.swift
//  
//
//  Created by BJIT on 1/30/22.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var sun: String?
    @NSManaged public var mon: String?
    @NSManaged public var tue: String?
    @NSManaged public var wed: String?
    @NSManaged public var thu: String?
    @NSManaged public var fri: String?
    @NSManaged public var sat: String?
    @NSManaged public var habitname: String?
    @NSManaged public var habitTime: String?
    @NSManaged public var habitimage: String?
    @NSManaged public var habitdate: Date?
    @NSManaged public var timeDuration: String?
    @NSManaged public var habitdateData: String?
    @NSManaged public var reminder: String?

}
