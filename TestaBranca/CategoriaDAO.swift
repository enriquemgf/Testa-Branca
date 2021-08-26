//
//  CategoriaDAO.swift
//  TestaBranca
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 PUCPR. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CategoriaDAO {
    
    static func inserir(categoria:Categoria){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insert(categoria)
        
        do{
            try context.save()
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    static func atualizar(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        
        do{
            try context.save()
        }catch let erro as NSError{
            print(erro)
        }
    }
    
    static func excluir(categoria:Categoria){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.delete(categoria)
        
        do{
            try context.save()
        }catch let erro as NSError{
            print(erro)
        }
    }

    
    static func obterTodos()->[Categoria]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var categorias:[Categoria] = [Categoria]()
        let request:NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Categoria")
        
        do{
            categorias = try context.fetch(request) as! [Categoria]
        }catch let erro as NSError{
            print(erro)
        }
        return categorias
    }
    
    static func obterPorNome(nomeCategoria:String)->Categoria{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var categorias: [Categoria]!
        let request:NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Categoria")
        request.predicate = NSPredicate(format: "nome == %@", nomeCategoria)
        
        
        do{
            categorias = try context.fetch(request) as! [Categoria]
        }catch let erro as NSError{
            print(erro)
        }
        return categorias[0]
    }

}
