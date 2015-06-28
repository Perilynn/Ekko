//
//  AppDelegate.swift
//  Ekko
//
<<<<<<< HEAD
//  Created by Aravind Sundaresan on 6/27/15.
=======
//  Created by Rauhul Varma on 6/27/15.
>>>>>>> a2c2fa5e2d5c63620dc18d0fb3e3cc2c732f2236
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

<<<<<<< HEAD


  func applicationDidFinishLaunching(aNotification: NSNotification) {
    // Insert code here to initialize your application
=======
  @IBOutlet weak var window: NSWindow!

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    
    window.styleMask = NSBorderlessWindowMask
    var frame = window.frame
    frame.origin = NSPoint(x: 0, y: 0)
    frame.size = NSScreen.mainScreen()!.frame.size
    print(frame.size)
    window.setFrame(frame, display: true, animate: false)
    window.opaque = false
    
//    window.movableByWindowBackground = true
//    window.makeKeyAndOrderFront(nil)
//    window.excludedFromWindowsMenu = true
//    window.ignoresMouseEvents = true
//    window.orderFrontRegardless()
//    window.orderFront(nil)
//    window.makeKeyAndOrderFront(nil)
//    window.opaque = false

    window.backgroundColor = NSColor.redColor()
    window.canHide = false
    window.hasShadow = false
    window.alphaValue = 0.5
    window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.MaximumWindowLevelKey))
    let activeRegion = EkkoView(frame: window.frame)
    window.contentView.addSubview(activeRegion)
    
>>>>>>> a2c2fa5e2d5c63620dc18d0fb3e3cc2c732f2236
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }

<<<<<<< HEAD

}

=======
  
}

class EkkoView: NSView {
  
  override init(frame: NSRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewWillMoveToWindow(newWindow: NSWindow?) {
    let trackingArea = NSTrackingArea(rect: newWindow!.frame, options: [.ActiveAlways, .MouseEnteredAndExited, .EnabledDuringMouseDrag, .MouseMoved, .CursorUpdate], owner: self, userInfo: nil)
    self.addTrackingArea(trackingArea)
  }
  override func mouseDown(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseDown")
  }
  override func mouseDragged(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseDragged")
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
  override func mouseUp(theEvent: NSEvent) {
    //Preform Action
    NSLog("mouseUp")
  }
  override func cursorUpdate(event: NSEvent) {
    //Preform Action
    NSLog("cursorUpdate")
  }
}
>>>>>>> a2c2fa5e2d5c63620dc18d0fb3e3cc2c732f2236
