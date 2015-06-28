//
//  RequestHandler.swift
//  Ekko
//
//  Created by Naren Dasan on 6/28/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Foundation

import Cocoa 

class RequestHandler:NSObject {
    var pastString: String?
    func handleUrlRequest(url: String?, sound: Bool, notifs: Bool){
        if pastString != url {
            pastString = url
            if url != nil{
                
                var accept = true;
                if notifs {
                    let notif = NSUserNotification()
                    notif.title = "Your Group Shared:"
                    notif.subtitle = "\(url!)"
                    notif.hasActionButton = false
                    notif.setValue(NSImage(named: "AppIcon"), forKey: "_identityImage")
                    notif.setValue(false, forKey: "_identityImageHasBorder")
                    if sound {
                        notif.soundName = NSUserNotificationDefaultSoundName
                    }
                    NSUserNotificationCenter.defaultUserNotificationCenter().deliverNotification(notif)
                }
                if accept {
                    let myAppleScript = "open location \"\(url!)\""
                    var error: NSDictionary?
                    if let scriptObject = NSAppleScript(source: myAppleScript) {
                        scriptObject.executeAndReturnError(&error)
                        if (error != nil) {
                            print("error: \(error)")
                        }
                    
                    }
                }
            
            }
        }
    }
    
    func handleApplicationRequest(app: String){
        let myAppleScript = "tell application \"\(app)\" to activate"
        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: myAppleScript) {
            if let _: NSAppleEventDescriptor = scriptObject.executeAndReturnError(
                &error) {
                    if (error != nil) {
                        print("error: \(error)")
                    }
            }
        }
    }
}

