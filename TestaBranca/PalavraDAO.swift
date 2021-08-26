//
//  PalavraDAO.swift
//  TestaBranca
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 PUCPR. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PalavraDAO {
    
    static func inserir(palavra:Palavra){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insert(palavra)
        
        do{
            try context.save()
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    
    static func excluir(palavra:Palavra){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.delete(palavra)
        
        do{
            try context.save()
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    static func obterTodos()->[Palavra]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var palavras:[Palavra] = [Palavra]()
        let request:NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Palavra")
        
        do{
            palavras = try context.fetch(request) as! [Palavra]
        }catch let erro as NSError{
            print(erro)
        }
        return palavras
    }

}
