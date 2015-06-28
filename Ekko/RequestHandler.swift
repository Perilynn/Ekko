//
//  RequestHandler.swift
//  Ekko
//
//  Created by Naren Dasan on 6/28/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Foundation

class RequestHandler:NSObject {
    var pastString: String?
    func handleUrlRequest(url: String?){
        if pastString != url {
            pastString = url
            if url != nil{
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
