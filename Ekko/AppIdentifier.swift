//
//  AppIdentifier.swift
//  Ekko
//
//  Created by Naren Dasan on 6/27/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Foundation
import Cocoa

class AppIdentifier: NSObject {
  //getActiveApplication
  //returns the active application
  func getActiveApplication() -> [String?] {
    var appAndUrl:[String?] = [nil,nil];
    let myAppleScript = "tell application \"System Events\" to set frontApp to name of first application process whose frontmost is true"
    var error: NSDictionary?
    if let scriptObject = NSAppleScript(source: myAppleScript) {
      if let app: NSAppleEventDescriptor = scriptObject.executeAndReturnError(&error) {
        appAndUrl[0] = app.stringValue
        print(app.stringValue)
        if app.stringValue == "Firefox" || app.stringValue == "Safari" || app.stringValue == "Google Chrome"
        {
          appAndUrl[1] = getActiveTab(app.stringValue!)
        }
      }
      else if (error != nil) {
        print("error: \(error)")
      }
    }
    return appAndUrl
  }
  
  //getActiveTab
  //Params: Applicaiton name
  //returns: url of the current tab
  func getActiveTab(app:String) -> String? {
    var url: String?
    if app == "Firefox" {
      url = getFirefoxCurrentURL()
      if url != nil {
        return url
      }
    }
    else if app == "Google Chrome" {
      url = getChromeCurrentURL()
      if url != nil {
        return url
      }
    }
    else if app == "Safari" {
      url = getSafariCurrentURL()
      if url != nil {
        return url
      }
    }
    return nil
  }
  
  //getActiveTab
  //url helper function
  func getFirefoxCurrentURL() -> String? {
    let myAppleScript = "tell application \"Safari\" to return URL of front document as string"
    var url: String? = nil
    var error: NSDictionary?
    if let scriptObject = NSAppleScript(source: myAppleScript) {
      if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(
        &error) {
          url = output.stringValue
          print(output.stringValue)
      } else if (error != nil) {
        print("error: \(error)")
      }
    }
    return url
  }
  
  //getActiveTab
  //url helper function
  func getChromeCurrentURL() -> String? {
    let myAppleScript = "tell application \"Google Chrome\" to return URL of active tab of front window as string"
    var url: String? = nil
    var error: NSDictionary?
    if let scriptObject = NSAppleScript(source: myAppleScript) {
      if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(
        &error) {
          url = output.stringValue
          print(output.stringValue)
      } else if (error != nil) {
        print("error: \(error)")
      }
    }
    return url
  }
  
  //getActiveTab
  //url helper function
  func getSafariCurrentURL() -> String? {
    let myAppleScript = "tell application \"Safari\" to return URL of front document as string"
    var url: String? = nil
    var error: NSDictionary?
    if let scriptObject = NSAppleScript(source: myAppleScript) {
      if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(
        &error) {
          url = output.stringValue
          print(output.stringValue)
      } else if (error != nil) {
        print("error: \(error)")
      }
    }
    return url
  }
  
  //func openPage(url: String) -> String {
  //    let url = NSURL(string: "\(url)")!
  //    UIApplication.sharedApplication().openURL(url)
  //}
}