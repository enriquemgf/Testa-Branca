//
//  Resultado+CoreDataProperties.swift
//  TestaBranca
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 PUCPR. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Resultado {

    @NSManaged var jogador: String?
    @NSManaged var pontuacao: NSNumber?
    @NSManaged var data: NSDate?

}
