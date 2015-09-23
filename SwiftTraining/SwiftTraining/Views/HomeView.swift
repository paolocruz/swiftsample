//
//  HomeView.swift
//  SwiftTraining
//
//  Created by Allister Alambra on 9/22/15.
//  Copyright (c) 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol{
    func addButton()
}

class HomeView: BaseView{
    
    @IBOutlet weak var entryTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    var delegate: HomeViewProtocol?
    
    @IBAction func addButton(sender: AnyObject) {
        if self.delegate != nil && self.delegate?.addButton != nil{
            self.delegate?.addButton()
        }
    }
    
}