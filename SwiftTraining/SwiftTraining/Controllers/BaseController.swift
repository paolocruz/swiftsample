//
//  BaseController.swift
//  SwiftTraining
//
//  Created by Allister Alambra on 9/22/15.
//  Copyright (c) 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

class BaseController: UIViewController{
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadXibName(xibName: String){
        
        var xibs:Array = NSBundle.mainBundle().loadNibNamed(xibName, owner: self, options: nil)!
        
        if xibs.count > 0{
            self.view = xibs[0] as! UIView
            print("Found at least one xib!");
        }
        else{
            print("No Xibs Found.")
        }
    }
    
}