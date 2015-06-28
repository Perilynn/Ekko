//
//  AppDelegate.swift
//  Ekko
//
//  Created by Rauhul Varma on 6/27/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  let responder = EkkoResponder()
  var state: MousePositionState = .Exited
  @IBOutlet weak var window: NSWindow!
  @IBOutlet weak var statusMenu: NSMenu!
  let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
  
  var myRef = Firebase(url:"https://greylock-ekko.firebaseio.com/ios/urls/")

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    window.styleMask = NSBorderlessWindowMask
    let screen = NSScreen.mainScreen()!.frame
    window.setFrame(NSRect(x: screen.width - 35, y: 0, width: 35, height: screen.height), display: true)
    window.backgroundColor = NSColor.grayColor()
    window.alphaValue = 0.01
    window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.MaximumWindowLevelKey))
    let icon = NSImage(named: "MenuIcon")
    statusItem.image = icon
    statusItem.menu = statusMenu
    authWithPassword()
    hasBumped("https://www.google.com") //will replace with input string from AppleScript
    
    
    
    NSEvent.addGlobalMonitorForEventsMatchingMask(NSEventMask.LeftMouseDraggedMask) { (event: NSEvent) -> Void in
      if NSScreen.mainScreen()!.frame.width - event.locationInWindow.x < 35 {
        if self.state == .Exited {
          self.responder.commonShowMeSomthingNew(.Entered)
          self.showHideEkko(.Entered)
          self.state = .Entered
        } else {
          self.responder.commonShowMeSomthingNew(.Inside)
          self.showHideEkko(.Inside)
          self.state = .Inside
        }
      } else if self.state == .Entered || self.state == .Inside {
        self.responder.commonShowMeSomthingNew(.Exited)
        self.showHideEkko(.Exited)
        self.state = .Exited
      }
    }
  }
  
  func showHideEkko(state: MousePositionState) {
    switch state {
    case .Entered:
      window.alphaValue = 0.35
    case .Inside:
      window.alphaValue = 0.35
    case .Exited:
      window.alphaValue = 0.0
    }
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
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
    firebaseListener()
  }
  
  func authWithGitHub() {
    
    
  }
  
  func hasBumped(url: String) {
    // Write data to Firebase
    //    var myLink = ["application": "Google Chrome", "url": "https://www.google.com"]
    //    var yourLink = ["application": "Firefox", "url": "https://www.facebook.com"]
    //    var usersRef = myRef.childByAppendingPath("users")
    //
    //    var users = ["Aravind": myLink, "Naren": yourLink]
    //    usersRef.setValue(users)
    var link = ["name": "Google Chrome", "url": url]
    myRef.updateChildValues(link)
  }
  
  func firebaseListener() {
    myRef.observeEventType(.Value, withBlock: { snapshot in
      print(snapshot.value.objectForKey("url")!)
      }, withCancelBlock: { error in
        print(error.description)
    })
  }
}

