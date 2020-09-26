//
//  Category+CoreDataProperties.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 26/09/20.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var categoryToCourse: Course?
    @NSManaged public var categoryToCourseimage: Image?

}

extension Category : Identifiable {

}
