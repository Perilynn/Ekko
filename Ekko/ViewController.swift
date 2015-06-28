//
//  ViewController.swift
//  Ekko
//
//  Created by Aravind Sundaresan on 6/27/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Cocoa
import AppKit
import Foundation
import CoreGraphics

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
  
  

class apple: NSView {
  
  override func viewWillMoveToWindow(newWindow: NSWindow?) {
    let rect = CGRectMake(0, 0, newWindow!.frame.width, newWindow!.frame.height)
    let trackingArea = NSTrackingArea(rect: rect, options: [.ActiveAlways, .MouseEnteredAndExited, .EnabledDuringMouseDrag], owner: self, userInfo: nil)
    self.addTrackingArea(trackingArea)
  }
  
  override func mouseEntered(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseEntered")
  }
  override func mouseExited(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseExited")
  }
  override func mouseMoved(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseMoved")
  }
  override func mouseDragged(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseDragged")
  }
  override func mouseDown(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseDown")
  }
  override func mouseUp(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseUp")
  }
  override func cursorUpdate(event: NSEvent) {
    //Preform Action
    NSLog("cursorUpdate")
  }
  
}

class clearWindow: NSWindow {
  
  override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, `defer` flag: Bool) {
    super.init(contentRect: NSScreen.mainScreen()!.frame, styleMask: NSBorderlessWindowMask, backing: .Buffered, `defer`: false)
    thing()
  }
  
  required init?(coder: NSCoder) {
    super.init(contentRect: NSScreen.mainScreen()!.frame, styleMask: NSBorderlessWindowMask, backing: .Buffered, `defer`: false)
    thing()
    
  }

  func thing() {
    backgroundColor = NSColor.clearColor()
    excludedFromWindowsMenu = true
    canHide = false
    hasShadow = false
    alphaValue = 0.5
    ignoresMouseEvents = true
    opaque = false
    orderFrontRegardless()
    level = Int(CGWindowLevelForKey(CGWindowLevelKey.MaximumWindowLevelKey)) + 1
    orderFront(nil)
    makeKeyAndOrderFront(nil)
  }
  
  
  
  
  
  
}

