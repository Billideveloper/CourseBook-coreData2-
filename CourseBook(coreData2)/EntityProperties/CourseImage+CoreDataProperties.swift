//
//  CourseImage+CoreDataProperties.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 25/09/20.
//
//

import Foundation
import CoreData


extension CourseImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CourseImage> {
        return NSFetchRequest<CourseImage>(entityName: "CourseImage")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var courseimagetocategory: Category?
    @NSManaged public var courseimagetocourse: Course?

}

extension CourseImage : Identifiable {

}
