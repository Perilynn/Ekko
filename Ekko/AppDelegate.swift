//
//  AppDelegate.swift
//  Ekko
//
//  Created by Aravind Sundaresan on 6/27/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  @IBOutlet weak var statusMenu: NSMenu!
  
  var myRef = Firebase(url:"https://greylock-ekko.firebaseio.com/ios/urls/")
  
  let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    // Insert code here to initialize your application
    let icon = NSImage(named: "MenuIcon")
    statusItem.image = icon
    statusItem.menu = statusMenu
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }
  
  @IBAction func menuClicked(sender: NSMenuItem) {
    // when icon on statusBar is clicked
  }
  
  @IBAction func quitClicked(sender: NSMenuItem) {
    NSApplication.sharedApplication().terminate(self)
  }
  
  func authWithPassword() {
    myRef.authUser("sundrsn2@illinois.edu", password: "ekko1",
      withCompletionBlock: {error, authData in

        if error != nil {
          //error logging in
        }
        else {
          //now logged in
        }
    });
    hasBumped()
  }
  
//  func authWithGitHub() {    
//  }
  
  func hasBumped() {
    // Write data to Firebase
    var myLink = ["application": "Google Chrome", "url": "https://www.google.com"]
    var yourLink = ["application": "Firefox", "url": "https://www.facebook.com"]
    var usersRef = myRef.childByAppendingPath("users")
    
    var users = ["Aravind": myLink, "Naren": yourLink]
    usersRef.setValue(users)
    
  }
  
  func firebaseListener() {
    myRef.observeEventType(.Value, withBlock: { snapshot in
      print(snapshot.value)
      }, withCancelBlock: { error in
        print(error.description)
    })
  }
  
  func titlesFromJSON(data: NSData) -> [String] {
    var titles = [String]()
    var jsonError: NSError?
    
    if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? [String: AnyObject],
      feed = json["feed"] as? [String: AnyObject],
      entries = feed["entry"] as? [[String: AnyObject]]
    {
      for entry in entries {
        if let name = entry["im:name"] as? [String: AnyObject],
          label = name["label"] as? String {
            titles.append(label)
        }
      }
    } else {
      if let jsonError = jsonError {
        println("json error: \(jsonError)")
      }
    }
    
    return titles
  }

}

