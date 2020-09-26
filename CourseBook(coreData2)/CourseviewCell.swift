//
//  CourseviewCell.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 25/09/20.
//

import UIKit


class CourseviewCell: UITableViewCell {

    
    @IBOutlet weak var courseName: UILabel!
    
    @IBOutlet weak var AuthorEmail: UILabel!
    
    @IBOutlet weak var AuthorName: UILabel!
    
    @IBOutlet weak var publishDate: UILabel!
    
    @IBOutlet weak var coursePrice: UILabel!
    
    @IBOutlet weak var courseImage: UIImageView!
    
    @IBOutlet weak var courseBackgroundview: UIView!
    
    
    
    func courseinfo(course: Course){
        
        self.courseName.text = course.coursename
        self.coursePrice.text = "\(course.price)$"
        self.AuthorName.text = course.by
        self.AuthorEmail.text = course.email
        
        if let Coursedate = course.publishdate{
            self.publishDate.text = "\(Coursedate)"
        }
        
        //todo set image 
        

    }
    
    
    
    
    
}
