//
//  Image+CoreDataProperties.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 26/09/20.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var courseimagetocategory: Category?
    @NSManaged public var courseimagetocourse: Course?

}

extension Image : Identifiable {

}
