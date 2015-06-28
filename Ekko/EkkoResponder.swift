//
//  EkkoResponder.swift
//  Ekko
//
//  Created by Rauhul Varma on 6/28/15.
//  Copyright © 2015 GreylockBetas. All rights reserved.
//

import Foundation

class EkkoResponder: NSObject {
  func commonShowMeSomthingNew(state: MousePositionState) {
    switch state {
    case .Entered:
      print("Entered")
    case .Inside:
      print("Inside")
    case .Exited:
      print("Exited")
    }
  }
}