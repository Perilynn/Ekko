//
//  ViewController.swift
//  Ekko
//
//  Created by Aravind Sundaresan on 6/27/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Write data to Firebase
    var myLink = ["application": "Google Chrome", "url": "https://www.google.com"]
    var yourLink = ["application": "Firefox", "url": "https://www.facebook.com"]
    var usersRef = myRef.childByAppendingPath("users")
    
    var users = ["Aravind": myLink, "Naren": yourLink]
    usersRef.setValue(users)
    // Do any additional setup after loading the view.
    
  }

  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
  


}

