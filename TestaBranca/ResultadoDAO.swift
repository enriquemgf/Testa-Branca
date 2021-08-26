//
//  ResultadoDAO.swift
//  TestaBranca
//
//  Created by Student on 6/28/16.
//  Copyright © 2016 PUCPR. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ResultadoDAO {
    
    static func inserir(resultado:Resultado){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insert(resultado)
        
        do{
            try context.save()
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    static func excluir(resultado:Resultado){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.delete(resultado)
        
        do{
            try context.save()
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    static func obterTodos()->[Resultado]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var resultados:[Resultado] = [Resultado]()
        let request:NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Resultado")
        request.sortDescriptors = [NSSortDescriptor(key:"pontuacao", ascending: false)]
        
        do{
            resultados = try context.fetch(request) as! [Resultado]
        }catch let erro as NSError{
            print(erro)
        }
        return resultados
    }
}
