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
  var state: mousePositionState = .Exited
  @IBOutlet weak var window: NSWindow!

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    window.styleMask = NSBorderlessWindowMask
    window.setFrame(NSRect(x: 0, y: 0, width: 0, height: 0), display: false)
    
    NSEvent.addGlobalMonitorForEventsMatchingMask(NSEventMask.LeftMouseDraggedMask) { (event: NSEvent) -> Void in
      if NSScreen.mainScreen()!.frame.width - event.locationInWindow.x < 25 {
        if self.state == .Exited {
          self.responder.commonShowMeSomthingNew(.Entered)
          self.state = .Entered
        } else {
          self.responder.commonShowMeSomthingNew(.Inside)
          self.state = .Inside
        }
      } else if self.state == .Entered || self.state == .Inside {
        self.responder.commonShowMeSomthingNew(.Exited)
        self.state = .Exited
      }
      
    }
  }
  
  func showHideEkko() {
    
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }
}

class EkkoResponder: NSObject {
  func commonShowMeSomthingNew(state: mousePositionState) {
    switch state {
    case .Entered:
      print("Entered")
    case .Inside:
      print("Inside")
    case .Exited:
      print("Exited")
    default:
      NSLog("")
    }
  }
}

enum mousePositionState {
  case Entered, Inside, Exited
}

