//
//  JogadoresVC.swift
//  FinalProject
//
//  Created by Enrique  Martinez on 27/06/16.
//  Copyright © 2016 Enrique  Martinez. All rights reserved.
//

import UIKit



class JogadoresVC: UIViewController {

    let corJogadores = [
        "Vermelho": UIColor.init(red: 255.0/255, green: 39.0/255, blue: 64.0/255, alpha: 1.0),
        "Verde": UIColor.init(red: 0.0/255, green: 218.0/255, blue: 34.0/255, alpha: 1.0),
        "Amarelo": UIColor.init(red: 254.0/255, green: 218.0/255, blue: 30.0/255, alpha: 1.0),
        "Azul": UIColor.init(red: 3.0/255, green: 235.0/255, blue: 254.0/255, alpha: 1.0),
        "Rosa": UIColor.init(red: 255.0/255, green: 88.0/255, blue: 252.0/255, alpha: 1.0)]
    
    @IBOutlet weak var Categoria: UINavigationItem!
    @IBOutlet weak var jog1: UIButton!
    @IBOutlet weak var jog2: UIButton!
    @IBOutlet weak var jog3: UIButton!
    @IBOutlet weak var jog4: UIButton!
    @IBOutlet weak var jog5: UIButton!
    @IBOutlet weak var addButton: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Categoria.title = "Frutas"
        
        addButton.layer.cornerRadius = 23
        addButton.layer.borderWidth = 2.0
        
        jog1.layer.cornerRadius = 10
        jog1.layer.borderWidth = 2.0
        jog1.backgroundColor = corJogadores["Vermelho"]
        
        jog2.layer.cornerRadius = 10
        jog2.layer.borderWidth = 2.0
        jog2.backgroundColor = corJogadores["Verde"]
        
        jog3.layer.cornerRadius = 10
        jog3.layer.borderWidth = 2.0
        jog3.backgroundColor = corJogadores["Amarelo"]
        
        jog4.layer.cornerRadius = 10
        jog4.layer.borderWidth = 2.0
        jog4.backgroundColor = corJogadores["Azul"]
        
        jog5.layer.cornerRadius = 10
        jog5.layer.borderWidth = 2.0
        jog5.backgroundColor = corJogadores["Rosa"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Add(sender: AnyObject) {
        if !jog3.isEnabled {
            UIView.animate(withDuration: 1, animations: {
                self.jog3.isEnabled = true
                self.jog3.alpha = 1.0
                self.addButton.center = self.jog4.center
            })
            
        } else if !jog4.isEnabled {
            UIView.animate(withDuration: 1, animations: {
                self.jog4.isEnabled = true
                self.jog4.alpha = 1.0
                self.addButton.center = self.jog5.center
            })
            
        }else if !jog5.isEnabled {
            addButton.alpha = 0
            addButton.isEnabled = false
            UIView.animate(withDuration: 1, animations: {
                self.jog5.isEnabled = true
                self.jog5.alpha = 1.0
            })
        }
    }
    
    
    @IBAction func ChangeColor(sender: UIButton) {
        switch sender {
        case jog1:
            UIView.animate(withDuration: 0.5, animations: {
                self.jog1.backgroundColor = self.newColor(atual: self.jog1.backgroundColor!)
            })
            
            break
        case jog2:
            UIView.animate(withDuration: 0.5, animations: {
                self.jog2.backgroundColor = self.newColor(atual: self.jog2.backgroundColor!)
            })
            
            break
        case jog3:
            UIView.animate(withDuration: 0.5, animations: {
                self.jog3.backgroundColor = self.newColor(atual: self.jog3.backgroundColor!)
            })
            
            break
        case jog4:
            UIView.animate(withDuration: 0.5, animations: {
                self.jog4.backgroundColor = self.newColor(atual: self.jog4.backgroundColor!)
            })
            
            break
        case jog5:
            UIView.animate(withDuration: 0.5, animations: {
                self.jog5.backgroundColor = self.newColor(atual: self.jog5.backgroundColor!)
            })
            
            break
        default:
            break
        }
    }
    
    func newColor(atual:UIColor)->UIColor{
        switch atual {
        case self.corJogadores["Vermelho"]! :
            return corJogadores["Verde"]!
        case self.corJogadores["Verde"]! :
            return corJogadores["Amarelo"]!
        case self.corJogadores["Amarelo"]! :
            return corJogadores["Azul"]!
        case self.corJogadores["Azul"]! :
            return corJogadores["Rosa"]!
        case self.corJogadores["Rosa"]! :
            return corJogadores["Vermelho"]!
        default:
            return UIColor.white
        }
    }
    
    func createArray()->[(nome:String,cor:String)]{
        var array:[(nome:String,cor:String)] = []
        switch jog1.backgroundColor! {
        case corJogadores["Vermelho"]!:
            array.append(("Jogador 1","Vermelho"))
            break
        case corJogadores["Verde"]!:
            array.append(("Jogador 1","Verde"))
            break
        case corJogadores["Amarelo"]!:
            array.append(("Jogador 1","Amarelo"))
            break
        case corJogadores["Azul"]!:
            array.append(("Jogador 1","Azul"))
            break
        case corJogadores["Rosa"]!:
            array.append(("Jogador 1","Rosa"))
            break
        default:
            break
        }
        
        switch jog2.backgroundColor! {
        case corJogadores["Vermelho"]!:
            array.append(("Jogador 2","Vermelho"))
            break
        case corJogadores["Verde"]!:
            array.append(("Jogador 2","Verde"))
            break
        case corJogadores["Amarelo"]!:
            array.append(("Jogador 2","Amarelo"))
            break
        case corJogadores["Azul"]!:
            array.append(("Jogador 2","Azul"))
            break
        case corJogadores["Rosa"]!:
            array.append(("Jogador 2","Rosa"))
            break
        default:
            break
        }
        
        if jog3.isEnabled {
            switch jog3.backgroundColor! {
            case corJogadores["Vermelho"]!:
                array.append(("Jogador 3","Vermelho"))
                break
            case corJogadores["Verde"]!:
                array.append(("Jogador 3","Verde"))
                break
            case corJogadores["Amarelo"]!:
                array.append(("Jogador 3","Amarelo"))
                break
            case corJogadores["Azul"]!:
                array.append(("Jogador 3","Azul"))
                break
            case corJogadores["Rosa"]!:
                array.append(("Jogador 3","Rosa"))
                break
            default:
                break
            }
        }
        
        if jog4.isEnabled {
            switch jog4.backgroundColor! {
            case corJogadores["Vermelho"]!:
                array.append(("Jogador 4","Vermelho"))
                break
            case corJogadores["Verde"]!:
                array.append(("Jogador 4","Verde"))
                break
            case corJogadores["Amarelo"]!:
                array.append(("Jogador 4","Amarelo"))
                break
            case corJogadores["Azul"]!:
                array.append(("Jogador 4","Azul"))
                break
            case corJogadores["Rosa"]!:
                array.append(("Jogador 4","Rosa"))
                break
            default:
                break
            }
        }
        
        if jog5.isEnabled {
            switch jog5.backgroundColor! {
            case corJogadores["Vermelho"]!:
                array.append(("Jogador 5","Vermelho"))
                break
            case corJogadores["Verde"]!:
                array.append(("Jogador 5","Verde"))
                break
            case corJogadores["Amarelo"]!:
                array.append(("Jogador 5","Amarelo"))
                break
            case corJogadores["Azul"]!:
                array.append(("Jogador 5","Azul"))
                break
            case corJogadores["Rosa"]!:
                array.append(("Jogador 5","Rosa"))
                break
            default:
                break
            }
        }
        
        
        
        return array
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "GameStart" {
            let array:[(nome:String,cor:String)] = createArray()
            let view = segue.destination as! GamePlayVC
            view.jogadores = array
            let palavras = CategoriaDAO.obterPorNome(nomeCategoria: self.Categoria.title!).palavras?.allObjects as! [Palavra]
            var aux:[String] = []
            for item in palavras {
                aux.append(item.nome!)
            }
            view.arrayPalavras = aux
            
        }
        
    }
    

}
