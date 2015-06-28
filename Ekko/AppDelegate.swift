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
    var appId = AppIdentifier()
    var appCreator = RequestHandler()
    var state: MousePositionState = .Exited
    @IBOutlet weak var window: NSWindow!
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    var firebaseConnector = FirebaseInterface()
    var myRef = Firebase(url:"https://greylock-ekko.firebaseio.com/ios/urls/")
    let quitItem = NSMenuItem(title: "Quit", action: "quit", keyEquivalent: "q")
    let notifItem = NSMenuItem(title: "Notifications", action: "notifications", keyEquivalent: "n")
    let focusItem = NSMenuItem(title: "Focus Mode", action: "focus", keyEquivalent: "f")
    let muteItem = NSMenuItem(title: "Mute Sound", action: "mute", keyEquivalent: "m")

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        window.styleMask = NSBorderlessWindowMask
        let screen = NSScreen.mainScreen()!.frame
        
        window.setFrame(NSRect(x: screen.width - 50, y: 0, width: 50, height: screen.height), display: true)
        window.backgroundColor = NSColor.grayColor()
        window.alphaValue = 0.01
        window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.MaximumWindowLevelKey))
        
        statusItem.image = NSImage(named: "MenuIcon")
        statusItem.menu = NSMenu(title: "Ekko")
        
        statusItem.menu!.addItem(focusItem)
        statusItem.menu!.addItem(muteItem)
        statusItem.menu!.addItem(notifItem)
        statusItem.menu!.addItem(quitItem)
        
        authWithPassword()
        
        NSEvent.addGlobalMonitorForEventsMatchingMask(NSEventMask.LeftMouseDraggedMask) { (event: NSEvent) -> Void in
            if NSScreen.mainScreen()!.frame.width - event.locationInWindow.x < 50 {
                if self.state == .Exited {
                    var app:[String?] = self.appId.getActiveApplication()
                    if app[1] != nil {
                        self.hasBumped(app[1]!)
                    }
                    self.showHideEkko(.Entered)
                    self.state = .Entered
                } else {
                    self.showHideEkko(.Inside)
                    self.state = .Inside
                }
            } else if self.state == .Entered || self.state == .Inside {
                self.showHideEkko(.Exited)
                self.state = .Exited
            }
        }
    }
    
    func quit() {
        NSApp.terminate(nil)
    }
    
    
    
    var notifs = true
    func notifications() {
        if notifs {
            notifItem.title = "Notifications ✓"
        } else {
            notifItem.title = "Notifications"
        }
        notifs = !notifs
    }
    
    var sound = true
    func mute() {
        if sound {
            muteItem.title = "Mute Sound ✓"
        } else {
            muteItem.title = "Mute Sound"
        }
        sound = !sound
    }
    
    var ekkoing = true
    func focus() {
        if ekkoing {
            myRef.removeAllObservers()
            focusItem.title = "Focus Mode ✓"
        } else {
            firebaseListener()
            focusItem.title = "Focus Mode"
        }
        ekkoing = !ekkoing
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
        let link = ["name": "Google Chrome", "url": url]
        myRef.updateChildValues(link)
    }
    
    func firebaseListener() {
        myRef.observeEventType(.Value, withBlock: { snapshot in
            self.appCreator.handleUrlRequest(snapshot.value.objectForKey("url")! as? String, sound: self.sound, notifs: self.notifs)
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
}

