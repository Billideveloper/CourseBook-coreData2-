//
//  ViewController.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 25/09/20.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource , NSFetchedResultsControllerDelegate{
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var controller : NSFetchedResultsController<Course>!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
        
        //testdata()
        fetchCourses()
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let section = controller.sections{
            return section.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let msection = controller.sections{
            
            let sections = msection[section]
            
            return sections.numberOfObjects
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "mycourse", for: indexPath) as! CourseviewCell
        
        updatecellinfo(cell: cell, indexpath: indexPath as NSIndexPath)

        return cell
    }
    
 
    
    
    
    
    //MARK: - congigure controller
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        
        case .delete:
            if let indexPath = indexPath {
                tableview.deleteRows(at: [indexPath], with: .fade)
            }
            
        case .insert:
            if let indexPath = newIndexPath {
                tableview.insertRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                //TODO: Do something here
                let cell = tableview.cellForRow(at: indexPath) as! CourseviewCell
                updatecellinfo(cell: cell, indexpath: indexPath as NSIndexPath)
            }
        case .move:
            if let indexPath = indexPath {
                tableview.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableview.insertRows(at: [indexPath], with: .fade)
            }
            
        @unknown default:
            print("error")
        }
        
        
    }
    

    func updatecellinfo(cell:CourseviewCell,indexpath:NSIndexPath){
        let course = controller.object(at: indexpath as IndexPath)
        cell.courseinfo(course: course)
    }
    
    //MARK: - tableviewupdate
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableview.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableview.endUpdates()
    }
    
    
    //MARK: - fetchdata
    
    func fetchCourses(){
        
        let fetchRequest : NSFetchRequest<Course> = Course.fetchRequest()
        let moneysort = NSSortDescriptor(key: "price", ascending: true)
        fetchRequest.sortDescriptors = [moneysort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do{
            try controller.performFetch()
            
        }catch{
            
            let err = error as NSError
            print("\(err)")
            
        }
        
        
    }
    
    

//    func testdata(){
//        let course = Course(context: context)
//        course.coursename = "IOS 14 SWiftUI 2.0"
//        course.by = "Ravi Thakur"
//        course.email = "thakurravi450"
//        course.price = 50
//        appdelegate.saveContext()
//    }
    
}

