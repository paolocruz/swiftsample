//
//  DetailController.swift
//  SwiftTraining
//
//  Created by Allister Alambra on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

class DetailController:BaseController{
    
    var tStudent:Student?
    var detailView:DetailView?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXibName("DetailView")
        self.detailView = (self.view as! DetailView)
    }
    
    
    
}