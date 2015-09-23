//
//  HomeController.swift
//  SwiftTraining
//
//  Created by Allister Alambra on 9/22/15.
//  Copyright (c) 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

class HomeController:BaseController, UITableViewDelegate, UITableViewDataSource, HomeViewProtocol{
    
    var homeView: HomeView?
    var studentList: Array<Student>?
    var student: Student?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXibName("HomeView")
        self.homeView = (self.view as! HomeView)
        self.homeView?.entryTable.delegate = self
        self.homeView?.entryTable.dataSource = self
        self.homeView?.delegate = self
        self.studentList = Array<Student>()
        Connector.getStudents(processStudents)
    }
    
    override func viewDidLoad() {
        if self.respondsToSelector(Selector("edgesForExtendedLayout")) {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        Connector.getStudents(processStudents)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "HomeToDetailSegue" {
        let dest:DetailController = segue.destinationViewController as! DetailController
        dest.detailView?.nameDetailLabel.text = student?.name
        dest.detailView?.birthdayDetailLabel.text = student?.bday
        dest.detailView?.degreeDetailLabel.text = student?.degree
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        student = studentList?[indexPath.row]
        self.performSegueWithIdentifier("HomeToDetailSegue", sender: self)
    }
    
    func processStudents(students: JSON){
        for (_, subJson) in students {
            //Do something you want
            studentList?.append(Student(name: subJson["name"].string!, bday: subJson["bday"].string!, degree: subJson["degree"].string!))
        }
        self.homeView?.entryTable.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (studentList?.count)!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Student List"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("LabelCell")
        
        if cell == nil{
            cell = UITableViewCell()
            cell!.textLabel?.text = "\(studentList![indexPath.row].name), \(studentList![indexPath.row].bday), \(studentList![indexPath.row].degree)"
            
        }
        
        return cell!
    }
    
    func addButton(){
        self.performSegueWithIdentifier("addStudentSegue", sender: self)
        //print("Button is pressed as per protocol.")
    }
    
}