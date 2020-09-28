//
//  addCourseViewController.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 25/09/20.
//

import UIKit
import CoreData
import IQKeyboardManager

class addCourseViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    var mcourse: Course!
    
    
    @IBOutlet var tapgesture: UITapGestureRecognizer!
    
    @IBOutlet weak var selectCourseImage: UIImageView!
    
    @IBOutlet weak var courseName: UITextField!
    
    @IBOutlet weak var authorEmail: UITextField!
    
    @IBOutlet weak var authorName: UITextField!
    
    @IBOutlet weak var coursePrice: UITextField!
    
    @IBOutlet weak var addCoursebtn: UIButton!
    
  
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectCourseImage.isUserInteractionEnabled = true
        selectCourseImage.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view.
        
        
    }
    

    
    @IBAction func opeanmedia(_ sender: Any) {
        
       
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    
    
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
        
        if let selectedimage = image{
        selectCourseImage.image = selectedimage
            
            picker.dismiss(animated: true, completion: nil)
        }else{
            
            debugPrint("select CourseImage")
        }
        
    }
    
    
    
    @IBAction func addCourse(_ sender: Any) {
        
//    var mcourse: Course!
//
//    let pic = Image(context: context)
//
//    mcourse.coursetocourseimage = pic
        
        
        
        var course: Course!
        
        let pic = Image(context: context)
        pic.image = selectCourseImage.image
        course = Course(context: context)
        course.coursetocourseimage = pic
        
        
//        let pic = CourseImage(context: context)
//
//        pic.image = selectCourseImage.image
//
//        mcourse.coursetocourseimage = pic
        
        
        
        if let coursename = courseName.text, let authoremail = authorEmail.text, let authorname = authorName.text, let price = coursePrice.text{

            course.coursename = coursename
            course.by = authorname
            course.email = authoremail
            course.price = (price as NSString).doubleValue


        }

        appdelegate.saveContext()
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
        
        
    }
}
