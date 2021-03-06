//  constants.swift
//  CourseBook(coreData2)
//
//  Created by Ravi Thakur on 25/09/20.
//

import UIKit

let appdelegate = UIApplication.shared.delegate as! AppDelegate
let context = appdelegate.persistentContainer.viewContext

class GradientView: UIView {
    
    
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        let color1 = #colorLiteral(red: 0, green: 0.9292984605, blue: 0.9380435348, alpha: 1)
        let color2 = #colorLiteral(red: 0.04604572803, green: 0.8995314837, blue: 0.7509846687, alpha: 0.6938677226)
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
       
    }
}
