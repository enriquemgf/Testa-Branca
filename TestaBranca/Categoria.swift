//
//  Categoria.swift
//  TestaBranca
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 PUCPR. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Categoria: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let entityDescription: NSEntityDescription = NSEntityDescription.entity(forEntityName: "Categoria", in: context)!
        
        self.init(entity: entityDescription, insertInto: context)
    }

}
