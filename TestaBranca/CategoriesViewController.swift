//
//  CategoriesViewController.swift
//  ProjetoFinal
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 FelipeBetoni. All rights reserved.
//

import UIKit

struct categoria{
    var nome_categoria: String!
    var imagem_categoria: String!
    
    init(nome: String, imagem: String){
        self.nome_categoria = nome
        self.imagem_categoria = imagem
    }
}

class CategoriesViewController: UICollectionViewController {
    
    
    var categoriaSelecionada:String = ""
    @IBOutlet weak var espaco_esquerdo: NSLayoutConstraint!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    private let reuseIdentifier = "CategoryCell"
    private let reuseIdentifierdir = "CategoryCelldir"

    var NumColumns = 2
    var array: [categoria] = [categoria]()
    var categorias: [[categoria]] = [[categoria]]()
    
    override func viewDidLoad() {
        
        let cat = CategoriaDAO.obterTodos()
        
        for item in cat {
            if array.count < 2{
                array.append(categoria(nome: item.nome!, imagem: item.imagem!))
            }else{
                categorias.append(array)
                array.removeAll()
                array.append(categoria(nome: item.nome!, imagem: item.imagem!))
            }
        }
        categorias.append(array)
        
        
//        let categoria1 = categoria(nome: "Esportes", imagem: "esportes")
//        let categoria2 = categoria(nome: "Animais", imagem: "animais")
//        let categoria3 = categoria(nome: "Desenhos", imagem: "desenhos")
//        let categoria4 = categoria(nome: "Frutas", imagem: "frutas")
//
//        array.append(categoria1)
//        array.append(categoria2)
//        categorias.append(array)
//        array.removeAll()
//        array.append(categoria3)
//        array.append(categoria4)
//        categorias.append(array)

        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.categorias.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categorias[section].count
    }
   
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CategoriesViewCell
        
        let categorie = categorias[indexPath.section][indexPath.row]
        
        cell.imagem_categoria.image = UIImage(named: categorie.imagem_categoria)
        cell.imagem_categoria.layer.borderWidth = 8.0
        cell.imagem_categoria.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {  //Metodo chamado quando a imagem é clicada
        //print("\(indexPath.section)\(indexPath.row)")
        let x = self.categorias[indexPath.section][indexPath.row]
        categoriaSelecionada = x.nome_categoria
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Jogadores") as! JogadoresVC
        view.Categoria.title = categoriaSelecionada
        navigationController?.pushViewController(view, animated: true)
        
        //self.performSegueWithIdentifier("selectPlayers", sender: self)
        
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectPlayers" {
            let view = segue.destination as! JogadoresVC
            view.Categoria.title = categoriaSelecionada
        }
        
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }

    
    
 }
extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.5, height: 150)
    }
}
