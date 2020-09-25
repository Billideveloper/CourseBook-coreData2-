//
//  Course+CoreDataClass.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 25/09/20.
//
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {
    
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.publishdate = NSDate() as Date
        
        
    }

}
