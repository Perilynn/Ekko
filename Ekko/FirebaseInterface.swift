//
//  FirebaseInterface.swift
//  Ekko
//
//  Created by Naren Dasan on 6/28/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Foundation

class FirebaseInterface:NSObject {
    
     var myRef = Firebase(url:"https://greylock-ekko.firebaseio.com/ios/urls/")
    
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
        print("SENT")
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