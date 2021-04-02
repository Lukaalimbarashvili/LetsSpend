//
//  isOrNotNewUser.swift
//  LetsSpend
//
//  Created by Ucha Dzotsenidze on 02.04.21.
//

import Foundation
import UIKit


class Core{
    
    static let shared = Core()
     
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func isNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}

