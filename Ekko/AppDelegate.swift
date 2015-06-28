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

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    window.styleMask = NSBorderlessWindowMask
    let screen = NSScreen.mainScreen()!.frame
    window.setFrame(NSRect(x: screen.width - 35, y: 0, width: 35, height: screen.height), display: true)
    window.backgroundColor = NSColor.grayColor()
    window.alphaValue = 0.01
    window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.MaximumWindowLevelKey))
    
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
}

