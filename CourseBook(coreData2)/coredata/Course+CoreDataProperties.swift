//
//  Course+CoreDataProperties.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 26/09/20.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var by: String?
    @NSManaged public var coursename: String?
    @NSManaged public var email: String?
    @NSManaged public var price: Double
    @NSManaged public var publishdate: Date?
    @NSManaged public var coursetoCategory: Category?
    @NSManaged public var coursetocourseimage: Image?

}

extension Course : Identifiable {

}
