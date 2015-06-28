//
//  EkkoResponder.swift
//  Ekko
//
//  Created by Rauhul Varma on 6/28/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Foundation

class EkkoResponder: NSObject {
  
    var appId = AppIdentifier()
    
    func commonShowMeSomthingNew() -> [String?] {
        var app:[String?] = appId.getActiveApplication()
        if app[0] != nil {
            return [nil,nil]
        }
        else{
            return app
        }
    }
}