//
//  AddStudentController.swift
//  SwiftTraining
//
//  Created by Paolo Miguel Cruz on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

class AddStudentController:BaseController,AddStudentProtocol {
    
    var addStudentView: AddStudentView?
    var studentData: Dictionary<String, String>?
    var st: Student?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXibName("AddStudentView")
        self.addStudentView = (self.view as! AddStudentView)
        self.addStudentView?.delegate = self
    }
    
    override func viewDidLoad() {
        if self.respondsToSelector(Selector("edgesForExtendedLayout")) {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    
    func submitButtonPressed()
    {
        self.studentData = ["name":self.addStudentView!.nameTextField.text!, "bday":self.addStudentView!.birthdayTextField.text!, "degree":self.addStudentView!.degreeTextField.text!]
        
       Connector.addStudent(processNewStudent, details: self.studentData!)
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    func processNewStudent(newStudent: JSON){
        self.st = Student(name: newStudent["name"].string!, bday: newStudent["bday"].string!, degree: newStudent["degree"].string!)
    }
}