//
//  Singleton.swift
//  TestaBranca
//
//  Created by Enrique  Martinez on 30/06/16.
//  Copyright © 2016 PUCPR. All rights reserved.
//

import UIKit

@objc class Singleton:NSObject {
    
    static let sharedInstance = Singleton()
    
    var sound:Bool = true
    
}
