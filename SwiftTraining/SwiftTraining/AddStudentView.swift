//
//  AddStudentView.swift
//  SwiftTraining
//
//  Created by Paolo Miguel Cruz on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol AddStudentProtocol{
    func submitButtonPressed()
}


class AddStudentView:BaseView{
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var degreeTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var delegate:AddStudentProtocol?
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        if self.delegate != nil && self.delegate?.submitButtonPressed != nil{
            self.delegate?.submitButtonPressed()
        }
    }

}
