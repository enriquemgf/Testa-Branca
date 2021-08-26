//
//  AppDelegate.swift
//  TestaBranca
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 PUCPR. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var nomeTabela:String!

    
    func application( _ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Override point for customization after application launch.
        
        if(UserDefaults.standard.bool(forKey: "HasLaunchedOnce"))
        {
            // app already launched
        }
        else
        {
            // This is the first launch ever
            UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
            UserDefaults.standard.synchronize()
            inicializaBanco()
        }
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        if self.window?.rootViewController?.presentedViewController is GamePlayVC {
            
            return UIInterfaceOrientationMask.landscapeRight
            
        }else {
            return UIInterfaceOrientationMask.all
        }
        
    }
    
    
    func inserirCategoria(nome:String, imagem:String, uso:Int){
        let categoria:Categoria = Categoria()
        categoria.nome = nome
        categoria.imagem = imagem
        categoria.uso = NSNumber(value: uso)
        CategoriaDAO.inserir(categoria: categoria)
    }
    
    func inserirPalavra(str:String){
        let palavra:Palavra = Palavra()
        palavra.nome = str
        let categoria:Categoria = CategoriaDAO.obterPorNome(nomeCategoria: nomeTabela)
        var listaPalavras:[Palavra] = categoria.palavras?.allObjects as! [Palavra]
        listaPalavras.append(palavra)
        let lista = NSSet(array: listaPalavras) as Set<NSObject>
        categoria.palavras = lista as NSSet
        CategoriaDAO.atualizar()
        
    }
    
    func inicializaBanco(){
        /*
         **conversão de List para NSObject para a persistencia
         -------------------------------------------------------------
         let lista = NSSet(array: listaPalavras) as Set<NSObject>
         categoria.palavras = lista
         -------------------------------------   ------------------------
         
         **Trazendo a lista do banco
         -------------------------------------------------------------
         let palavras:[Palavra] = CategoriaDAO.obterTodos()[0].palavras?.allObjects as! [Palavra]
         -------------------------------------------------------------
         
         **Imprimir a data no formato pt-br
         -------------------------------------------------------------
         func printDate(date: NSDate!)->String {
         let format: String = "dd/MM/YY"
         let dateFormatter = NSDateFormatter()
         dateFormatter.dateFormat = format
         return dateFormatter.stringFromDate(date)
         }
         
         */
        
        
        inserirCategoria(nome: "Famosos", imagem: "famosos", uso: 0)
        nomeTabela = "Famosos"
        inserirPalavra(str: "Pelé")
        inserirPalavra(str: "Xuxa")
        inserirPalavra(str: "Ronaldo")
        inserirPalavra(str: "Tiririca")
        inserirPalavra(str: "Silvio Santos")
        inserirPalavra(str: "Lula")
        inserirPalavra(str: "Dilma")
        inserirPalavra(str: "Gisele Bündchen")
        inserirPalavra(str: "Wagner Moura")
        inserirPalavra(str: "William Bonner")
        inserirPalavra(str: "Wesley Safadão")
        inserirPalavra(str: "Wanessa")
        inserirPalavra(str: "Chitãzinho & Xororó")
        inserirPalavra(str: "Roberto Carlos")
        inserirPalavra(str: "Carolina Dieckman")
        inserirPalavra(str: "Claudia Leitte")
        inserirPalavra(str: "Caio Castro")
        inserirPalavra(str: "Cauã Reymond")
        inserirPalavra(str: "Cleo Pires")
        inserirPalavra(str: "Michael Jackson")
        inserirPalavra(str: "Ximbinha")
        inserirPalavra(str: "Luciano Huck")
        inserirPalavra(str: "Gugu")
        inserirPalavra(str: "Faustão")
        inserirPalavra(str: "Caetano Veloso")
        inserirPalavra(str: "Cristiano Ronaldo")
        inserirPalavra(str: "Messi")
        inserirPalavra(str: "Anitta")
        inserirPalavra(str: "Angélica")
        inserirPalavra(str: "Ana Hickmann")
        inserirPalavra(str: "Adriane Galisteu")
        inserirPalavra(str: "Ana Maria Braga")
        inserirPalavra(str: "Antonio Fagundes")
        inserirPalavra(str: "André Marques")
        inserirPalavra(str: "Anderson Silva")
        inserirPalavra(str: "Bruna Marquezine")
        inserirPalavra(str: "Bruno Gagliasso")
        inserirPalavra(str: "Barack Obama")
        inserirPalavra(str: "Deborah Secco")
        inserirPalavra(str: "Hebe")
        inserirPalavra(str: "Daniela Mercury")
        inserirPalavra(str: "Dercy Gonçalves")
        inserirPalavra(str: "Daniel")
        inserirPalavra(str: "Maradona")
        inserirPalavra(str: "Daniella Cicarelli")
        inserirPalavra(str: "Eike Batista")
        inserirPalavra(str: "Jair Bolsonaro")
        inserirPalavra(str: "Fátima Bernardes")
        inserirPalavra(str: "Fernanda Lima")
        inserirPalavra(str: "Rodrigo Santoro")
        inserirPalavra(str: "Flavia Alessandra")
        inserirPalavra(str: "Fabio Porchat")
        inserirPalavra(str: "Fernanda Montenegro")
        inserirPalavra(str: "Fabio Assunção")
        inserirPalavra(str: "Jô Soares")
        inserirPalavra(str: "Romário")
        inserirPalavra(str: "Tom Jobim")
        inserirPalavra(str: "Cazuza")
        inserirPalavra(str: "Cassia Eller")
        inserirPalavra(str: "Chico Buarque")
        inserirPalavra(str: "Amado Batista")
        inserirPalavra(str: "Joelma")
        inserirPalavra(str: "Fernando Collor")
        inserirPalavra(str: "Grazi Massafera")
        inserirPalavra(str: "Zico")
        inserirPalavra(str: "Monteiro Lobato")
        inserirPalavra(str: "Raul Seixas")
        inserirPalavra(str: "Elis Regina")
        inserirPalavra(str: "Ivete Sangalo")
        inserirPalavra(str: "Renato Russo")
        inserirPalavra(str: "Justin Bieber")
        inserirPalavra(str: "Neymar")
        inserirPalavra(str: "Edir Macedo")
        inserirPalavra(str: "Ayrton Senna")
        inserirPalavra(str: "José Wilker")
        inserirPalavra(str: "Oscar Niemeyer")
        inserirPalavra(str: "Kaká")
        inserirPalavra(str: "Luana Piovani")
        inserirPalavra(str: "Leandro Hassum")
        inserirPalavra(str: "Lázaro Ramos")
        inserirPalavra(str: "Leonardo DiCaprio")
        inserirPalavra(str: "Didi")
        inserirPalavra(str: "Lulu Santos")
        inserirPalavra(str: "Madonna")
        inserirPalavra(str: "Murilo Rosa")
        inserirPalavra(str: "Megan Fox")
        inserirPalavra(str: "Marília Pera")
        inserirPalavra(str: "Marcelo Tas")
        inserirPalavra(str: "Otaviano Costa")
        inserirPalavra(str: "Paolla Oliveira")
        inserirPalavra(str: "Pedro Bial")
        inserirPalavra(str: "Reynaldo Gianecchini")
        inserirPalavra(str: "Rodrigo Lombardi")
        inserirPalavra(str: "Rodrigo Hilbert")
        inserirPalavra(str: "Regina Casé")
        inserirPalavra(str: "Sandy")
        inserirPalavra(str: "Susana Vieira")
        inserirPalavra(str: "Serginho Groisman")
        inserirPalavra(str: "Seu Jorge")
        inserirPalavra(str: "Thiaguinho")
        inserirPalavra(str: "Tony Ramos")
        inserirPalavra(str: "Tom Cavalvante")
        inserirPalavra(str: "Viviane Araújo")
        inserirPalavra(str: "Vera Fischer")
        inserirPalavra(str: "Zezé Di Camargo & Luciano")
        
        
        inserirCategoria(nome: "Filmes", imagem: "filmes", uso: 0)
        nomeTabela = "Filmes"
        inserirPalavra(str: "Titanic")
        inserirPalavra(str: "Edward māos de tesoura")
        inserirPalavra(str: "Procurando Nemo")
        inserirPalavra(str: "Como treinar seu dragāo")
        inserirPalavra(str: "Os vingadores")
        inserirPalavra(str: "X-men")
        inserirPalavra(str: "Querida, encolhi as crianças")
        inserirPalavra(str: "Olha quem está falando")
        inserirPalavra(str: "Homem-formiga")
        inserirPalavra(str: "Capitāo Amėrica")
        inserirPalavra(str: "Alice no país das maravilhas")
        inserirPalavra(str: "As crônicas de Nárnia")
        inserirPalavra(str: "Efeito borboleta")
        inserirPalavra(str: "A lagoa azul")
        inserirPalavra(str: "Rambo")
        inserirPalavra(str: "Missāo Impossível")
        inserirPalavra(str: "Velozes e Furiosos")
        inserirPalavra(str: "Amelie Poulain")
        inserirPalavra(str: "Pulp Fiction")
        inserirPalavra(str: "Kill Bill")
        inserirPalavra(str: "O Exterminador do Futuro")
        inserirPalavra(str: "Django")
        inserirPalavra(str: "Toy Story")
        inserirPalavra(str: "Divertida mente")
        inserirPalavra(str: "Shrek")
        inserirPalavra(str: "Harry Potter")
        inserirPalavra(str: "Um Estranho no Ninho")
        inserirPalavra(str: "50 Tons de Cinza")
        inserirPalavra(str: "Crepúsculo")
        inserirPalavra(str: "Gladiador")
        inserirPalavra(str: "A múmia")
        inserirPalavra(str: "Prenda-me se for capaz")
        inserirPalavra(str: "O curioso caso de Benjamin Button")
        inserirPalavra(str: "Debi e Lóide")
        inserirPalavra(str: "Fúria de titās")
        inserirPalavra(str: "Hėrcules")
        inserirPalavra(str: "A lenda do cavaleiro sem cabeça")
        inserirPalavra(str: "Sexta-feria 13")
        inserirPalavra(str: "Invocaçāo do mal")
        inserirPalavra(str: "O exorcista")
        inserirPalavra(str: "O chamado")
        inserirPalavra(str: "O iluminado")
        inserirPalavra(str: "O massacre da serrra elétrica")
        inserirPalavra(str: "Annabelle")
        inserirPalavra(str: "O rei leāo")
        inserirPalavra(str: "Frozen")
        inserirPalavra(str: "Kung Fu Panda")
        inserirPalavra(str: "Meu malvado favorito")
        inserirPalavra(str: "Monstros S.A.")
        inserirPalavra(str: "Os incríveis")
        inserirPalavra(str: "Wall-e")
        inserirPalavra(str: "A Bela e a Fera")
        inserirPalavra(str: "Forrest Gump")
        inserirPalavra(str: "O som do coraçāo")
        inserirPalavra(str: "O Poderoso Chefāo")
        inserirPalavra(str: "Brilho eterno de uma mente sem lembrança")
        inserirPalavra(str: "O Show de Thruman")
        inserirPalavra(str: "O Resgate do Soldado Ryan")
        inserirPalavra(str: "O Jogo da Imitaçāo")
        inserirPalavra(str: "A teoria de tudo")
        inserirPalavra(str: "Truque de Mestre")
        inserirPalavra(str: "Gravidade")
        inserirPalavra(str: "Interestelar")
        inserirPalavra(str: "Perido em marte")
        inserirPalavra(str: "E o vento levou")
        inserirPalavra(str: "Menina de ouro")
        inserirPalavra(str: "A culpa é das estrelas")
        inserirPalavra(str: "Os intocáveis")
        inserirPalavra(str: "Cidade de deus")
        inserirPalavra(str: "Tropa de elite")
        inserirPalavra(str: "Sempre ao seu lado")
        inserirPalavra(str: "Táxi")
        inserirPalavra(str: "O regresso")
        inserirPalavra(str: "Peixe grande")
        inserirPalavra(str: "O menino do pijama listrado")
        inserirPalavra(str: "A queda")
        inserirPalavra(str: "A vida é bela")
        inserirPalavra(str: "Transformers")
        inserirPalavra(str: "Tron")
        inserirPalavra(str: "Tróia")
        inserirPalavra(str: "300 de esparta")
        inserirPalavra(str: "Star Wars")
        inserirPalavra(str: "Star Trek")
        inserirPalavra(str: "Indiana Jones")
        inserirPalavra(str: "Mad max")
        inserirPalavra(str: "Piratas do caribe")
        inserirPalavra(str: "Batman")
        inserirPalavra(str: "Superman")
        inserirPalavra(str: "Deadpool")
        inserirPalavra(str: "Homem de ferro")
        inserirPalavra(str: "Hulk")
        inserirPalavra(str: "Independence Day")
        inserirPalavra(str: "A bússola de ouro")
        inserirPalavra(str: "007")
        inserirPalavra(str: "Os mercenários")
        inserirPalavra(str: "Matrix")
        inserirPalavra(str: "Guardiões da galáxia")
        inserirPalavra(str: "Divergente")
        inserirPalavra(str: "O senhor dos anéis")
        inserirPalavra(str: "O Hobbit")
        inserirPalavra(str: "Jogos vorazes")
        inserirPalavra(str: "O inferno de dante")
        inserirPalavra(str: "Homem de aço")
        inserirPalavra(str: "Jurassic Park")
        inserirPalavra(str: "Maze Runners")
        inserirPalavra(str: "Uma mente brilhante")
        inserirPalavra(str: "A hora da escuridāo")
        inserirPalavra(str: "Pânico")
        inserirPalavra(str: "Todo mundo em pânico")
        inserirPalavra(str: "Piranhas")
        inserirPalavra(str: "Tubarāo")
        inserirPalavra(str: "A lenda do tesouro perdido")
        inserirPalavra(str: "Ben-hur")
        inserirPalavra(str: "A lista de Schindler")
        inserirPalavra(str: "A māo que balança o berço")
        inserirPalavra(str: "IT")
        inserirPalavra(str: "O exorcismo de Emily Rose")
        inserirPalavra(str: "A hora do pesadelo")
        inserirPalavra(str: "O brinquedo assassino")
        inserirPalavra(str: "À espera de um milagre")
        inserirPalavra(str: "Sempre ao lado")
        inserirPalavra(str: "Marley e eu")
        inserirPalavra(str: "Click")
        inserirPalavra(str: "De volta para o futuro")
        inserirPalavra(str: "Orgulho e preconceito")
        inserirPalavra(str: "Coraçāo valente")
        inserirPalavra(str: "Sinais")
        inserirPalavra(str: "Contatos de quarto grau")
        inserirPalavra(str: "Clube da luta")
        inserirPalavra(str: "À procura da felicidade")
        inserirPalavra(str: "Eu - Robô")
        inserirPalavra(str: "Eu sou a lenda")
        inserirPalavra(str: "Avatar")
        inserirPalavra(str: "A origem")
        inserirPalavra(str: "13o distrito")
        inserirPalavra(str: "12 anos de escravidão")
        inserirPalavra(str: "11 homens e um segredo")
        inserirPalavra(str: "Os dez mandamentos")
        inserirPalavra(str: "Nove rainhas")
        inserirPalavra(str: "Os 8 odiados")
        inserirPalavra(str: "Seven")
        inserirPalavra(str: "O sexto sentido")
        inserirPalavra(str: "O quinto elemento")
        inserirPalavra(str: "O quarteto fantástico")
        inserirPalavra(str: "Os três patetas")
        inserirPalavra(str: "Dupla implacável")
        inserirPalavra(str: "Uma linda muher")
        inserirPalavra(str: "Robocop")

        
        
        inserirCategoria(nome: "Esportes", imagem: "esportes", uso: 0)
        nomeTabela = "Esportes"
        inserirPalavra(str: "Hockey")
        inserirPalavra(str: "Rugby")
        inserirPalavra(str: "Baseball")
        inserirPalavra(str: "Esgrima")
        inserirPalavra(str: "Karate")
        inserirPalavra(str: "Futebol Americano")
        inserirPalavra(str: "Curly")
        inserirPalavra(str: "Ping Pong")
        inserirPalavra(str: "Bocha")
        inserirPalavra(str: "Tenis")
        inserirPalavra(str: "Natação")
        inserirPalavra(str: "Ciclismo")
        inserirPalavra(str: "Doley")
        inserirPalavra(str: "Dadminton")
        inserirPalavra(str: "Dnowboard")
        inserirPalavra(str: "Canoagem")
        inserirPalavra(str: "Hipismo")
        inserirPalavra(str: "Polo Aquatico")
        inserirPalavra(str: "Ginástica Olímpica")
        inserirPalavra(str: "Ginástica Rítmico")
        inserirPalavra(str: "Triatlo")
        inserirPalavra(str: "Boxe")
        inserirPalavra(str: "Kung Fu")
        inserirPalavra(str: "Judo")
        inserirPalavra(str: "Jiu Jitsu")
        inserirPalavra(str: "Taekwond")
        inserirPalavra(str: "Krav Maga")
        inserirPalavra(str: "Muay Thai")
        inserirPalavra(str: "Levantamento de Peso")
        inserirPalavra(str: "Atletismo")
        inserirPalavra(str: "Mountain Bike")
        inserirPalavra(str: "Handbol")
        inserirPalavra(str: "Nado Sincronizado")
        inserirPalavra(str: "Remo")
        inserirPalavra(str: "Tiro com Arco")
        inserirPalavra(str: "Vela")
        inserirPalavra(str: "Basquetebol")
        inserirPalavra(str: "Arremesso de Peso")
        inserirPalavra(str: "Lançamento de Dardo")
        inserirPalavra(str: "Corrida")
        inserirPalavra(str: "Salto em Distancia")
        inserirPalavra(str: "Salto com Vara")
        inserirPalavra(str: "Críquete")
        inserirPalavra(str: "Bolixe")
        inserirPalavra(str: "Paintball")
        inserirPalavra(str: "Surf")
        inserirPalavra(str: "Parkour")
        inserirPalavra(str: "Patinação")
        inserirPalavra(str: "Esqui")
        
        inserirCategoria(nome: "Animais", imagem: "animais", uso: 0)
        nomeTabela = "Animais"
        inserirPalavra(str: "Bisão")
        inserirPalavra(str: "Abelha")
        inserirPalavra(str: "Águia")
        inserirPalavra(str: "Alce")
        inserirPalavra(str: "Andorinha")
        inserirPalavra(str: "Anta")
        inserirPalavra(str: "Antílope")
        inserirPalavra(str: "Aranha")
        inserirPalavra(str: "Arara")
        inserirPalavra(str: "Avestruz")
        inserirPalavra(str: "Babuíno")
        inserirPalavra(str: "Baleia")
        inserirPalavra(str: "Barata")
        inserirPalavra(str: "Boi")
        inserirPalavra(str: "Borboleta")
        inserirPalavra(str: "Búfalo")
        inserirPalavra(str: "Burro")
        inserirPalavra(str: "Cabra")
        inserirPalavra(str: "Camelo")
        inserirPalavra(str: "Canguru")
        inserirPalavra(str: "Cachorro")
        inserirPalavra(str: "Caracol")
        inserirPalavra(str: "Caranguejo")
        inserirPalavra(str: "Carneiro")
        inserirPalavra(str: "Castor")
        inserirPalavra(str: "Cavalo")
        inserirPalavra(str: "Chacal")
        inserirPalavra(str: "Chimpanzé")
        inserirPalavra(str: "Cisne")
        inserirPalavra(str: "Cobra")
        inserirPalavra(str: "Coelho")
        inserirPalavra(str: "Coiote")
        inserirPalavra(str: "Coruja")
        inserirPalavra(str: "Corvo")
        inserirPalavra(str: "Crocodilo")
        inserirPalavra(str: "Dragão de Comodo")
        inserirPalavra(str: "Elefante")
        inserirPalavra(str: "Enguia")
        inserirPalavra(str: "Esquilo")
        inserirPalavra(str: "Estrela do Mar")
        inserirPalavra(str: "Falcão")
        inserirPalavra(str: "Foca")
        inserirPalavra(str: "Formiga")
        inserirPalavra(str: "Galinha")
        inserirPalavra(str: "Gaivota")
        inserirPalavra(str: "Ganso")
        inserirPalavra(str: "Gato")
        inserirPalavra(str: "Gazela")
        inserirPalavra(str: "Girafa")
        inserirPalavra(str: "Gnu")
        inserirPalavra(str: "Golfinho")
        inserirPalavra(str: "Gorila")
        inserirPalavra(str: "Guaxinim")
        inserirPalavra(str: "Hamster")
        inserirPalavra(str: "Hiena")
        inserirPalavra(str: "Hipopotamo")
        inserirPalavra(str: "Iguana")
        inserirPalavra(str: "Jacaré")
        inserirPalavra(str: "Jaguar")
        inserirPalavra(str: "Javali")
        inserirPalavra(str: "Lagosta")
        inserirPalavra(str: "Lagarto")
        inserirPalavra(str: "Leão")
        inserirPalavra(str: "Leão Marinho")
        inserirPalavra(str: "Lebre")
        inserirPalavra(str: "Lêmure")
        inserirPalavra(str: "Leopardo")
        inserirPalavra(str: "Lhama")
        inserirPalavra(str: "Lobo")
        inserirPalavra(str: "Libélula")
        inserirPalavra(str: "Lontra")
        inserirPalavra(str: "Lula")
        inserirPalavra(str: "Macaco")
        inserirPalavra(str: "Morcego")
        inserirPalavra(str: "Morsa")
        inserirPalavra(str: "Mosca")
        inserirPalavra(str: "Mosquito")
        inserirPalavra(str: "Ostra")
        inserirPalavra(str: "Ouriço")
        inserirPalavra(str: "Ovelha")
        inserirPalavra(str: "Panda")
        inserirPalavra(str: "Pantera")
        inserirPalavra(str: "Pato")
        inserirPalavra(str: "Pavão")
        inserirPalavra(str: "Peixe Boi")
        inserirPalavra(str: "Pelicano")
        inserirPalavra(str: "Peru")
        inserirPalavra(str: "Piolho")
        inserirPalavra(str: "Pombo")
        inserirPalavra(str: "Porco")
        inserirPalavra(str: "Porco Espinho")
        inserirPalavra(str: "Porquinho da India")
        inserirPalavra(str: "Raposa")
        inserirPalavra(str: "Rato")
        inserirPalavra(str: "Rena")
        inserirPalavra(str: "Rinoceronte")
        inserirPalavra(str: "Rouxinol")
        inserirPalavra(str: "Sapo")
        inserirPalavra(str: "Salamandra")
        inserirPalavra(str: "Suricato")
        inserirPalavra(str: "Tartaruga")
        inserirPalavra(str: "Tatu")
        inserirPalavra(str: "Texugo")
        inserirPalavra(str: "Tigre")
        inserirPalavra(str: "Toupeira")
        inserirPalavra(str: "Tubarão")
        inserirPalavra(str: "Urso")
        inserirPalavra(str: "Veado")
        inserirPalavra(str: "Vespa")
        inserirPalavra(str: "Zebra")
        
        
        inserirCategoria(nome: "Desenhos", imagem: "desenhos", uso: 0)
        nomeTabela = "Desenhos"
        inserirPalavra(str: "Pica-pau")
        inserirPalavra(str: "Luluzinha")
        inserirPalavra(str: "Tom & Jerry")
        inserirPalavra(str: "Gato Felix")
        inserirPalavra(str: "Zé Colmeia")
        inserirPalavra(str: "Snoop")
        inserirPalavra(str: "Corrida Maluca")
        inserirPalavra(str: "Os Jetsons")
        inserirPalavra(str: "Manda Chuva")
        inserirPalavra(str: "Maguila, o gorila")
        inserirPalavra(str: "Johnny Bravo")
        inserirPalavra(str: "Pantera cor de rosa")
        inserirPalavra(str: "Gasparzinho")
        inserirPalavra(str: "Riquinho")
        inserirPalavra(str: "Scooby doo")
        inserirPalavra(str: "Homem aranha")
        inserirPalavra(str: "Os Flintstones")
        inserirPalavra(str: "Tartaruga Touchê")
        inserirPalavra(str: "Formiga Atômica")
        inserirPalavra(str: "Familia Addams")
        inserirPalavra(str: "Capitão Caverna")
        inserirPalavra(str: "Tutubarāo")
        inserirPalavra(str: "Bruxinha Sabrina")
        inserirPalavra(str: "Super Amigos")
        inserirPalavra(str: "Faísca e Fumaça")
        inserirPalavra(str: "Bam-bam e Pedrita")
        inserirPalavra(str: "Alvin e os esquilos")
        inserirPalavra(str: "Bettlejuice")
        inserirPalavra(str: "Ghostbusters")
        inserirPalavra(str: "Cavalo de fogo")
        inserirPalavra(str: "Comandos em açāo")
        inserirPalavra(str: "Caverna do dragāo")
        inserirPalavra(str: "Tio Patinhas")
        inserirPalavra(str: "Dennis, o pimentinha")
        inserirPalavra(str: "He-man")
        inserirPalavra(str: "Inspetor Bugiganga")
        inserirPalavra(str: "My little Poney")
        inserirPalavra(str: "Ursinho Pooh")
        inserirPalavra(str: "Os Simpsons")
        inserirPalavra(str: "Os Smurfs")
        inserirPalavra(str: "Tartarugas Ninjas")
        inserirPalavra(str: "Tarzan")
        inserirPalavra(str: "Thundercats")
        inserirPalavra(str: "Transformers")
        inserirPalavra(str: "Turma da Mônica")
        inserirPalavra(str: "Ursinhos carinhosos")
        inserirPalavra(str: "Pequeno Príncipe")
        inserirPalavra(str: "Aladdin")
        inserirPalavra(str: "Animaniacs")
        inserirPalavra(str: "Os Anjinhos")
        inserirPalavra(str: "As aventuras de Tintin")
        inserirPalavra(str: "Sonic")
        inserirPalavra(str: "Batman")
        inserirPalavra(str: "Bob Esponja")
        inserirPalavra(str: "Capitāo Planeta")
        inserirPalavra(str: "Catdog")
        inserirPalavra(str: "Digimon")
        inserirPalavra(str: "Doug Funny")
        inserirPalavra(str: "Historinhas de dragāo")
        inserirPalavra(str: "Du, Dudu e Edu")
        inserirPalavra(str: "Quarteto Fantástico")
        inserirPalavra(str: "Freakazoid")
        inserirPalavra(str: "Futurama")
        inserirPalavra(str: "Hey Arnold")
        inserirPalavra(str: "Laboratório de Dexter")
        inserirPalavra(str: "O Máscara")
        inserirPalavra(str: "As meninas superpoderosas")
        inserirPalavra(str: "Moranguinho")
        inserirPalavra(str: "A pequena sereia")
        inserirPalavra(str: "Pinky e o Cérebro")
        inserirPalavra(str: "Pokémon")
        inserirPalavra(str: "South Park")
        inserirPalavra(str: "Tropas estelares")
        inserirPalavra(str: "Super-homem")
        inserirPalavra(str: "Turma do Pateta")
        inserirPalavra(str: "A vaca e o frango")
        inserirPalavra(str: "Os vingadores")
        inserirPalavra(str: "X-men")
        inserirPalavra(str: "O pequeno urso")
        inserirPalavra(str: "Ben 10")
        inserirPalavra(str: "KND - Turma do bairro")
        inserirPalavra(str: "Dragon ball")
        inserirPalavra(str: "Samurai-X")
        inserirPalavra(str: "Mansāo Foster para amigos imaginários")
        inserirPalavra(str: "Hora da aventura")
        inserirPalavra(str: "As aventuras de Jackie Chan")
        inserirPalavra(str: "Liga da justiça")
        inserirPalavra(str: "Super-choque")
        inserirPalavra(str: "Phineas & Ferb")
        inserirPalavra(str: "Beavis and Butt-head")
        inserirPalavra(str: "Jovens Titās")
        inserirPalavra(str: "Medabots")
        inserirPalavra(str: "Beyblade")
        inserirPalavra(str: "Três espiās demais")
        inserirPalavra(str: "Happyt three friends")
        inserirPalavra(str: "Jimmy Neutros")
        inserirPalavra(str: "Astroboy")
        inserirPalavra(str: "Yu-Gi-Oh")
        inserirPalavra(str: "Cavaleiros do Zodíaco")
        inserirPalavra(str: "Super Patos")
        
        inserirCategoria(nome: "Comidas", imagem: "comidas", uso: 0)
        nomeTabela = "Comidas"
        inserirPalavra(str: "Pizza")
        inserirPalavra(str: "Lazanha")
        inserirPalavra(str: "Coxinha")
        inserirPalavra(str: "Esfiha")
        inserirPalavra(str: "Churros")
        inserirPalavra(str: "Macarrāo")
        inserirPalavra(str: "Tapioca")
        inserirPalavra(str: "Quirera")
        inserirPalavra(str: "Batata-doce")
        inserirPalavra(str: "Polenta")
        inserirPalavra(str: "Ovo")
        inserirPalavra(str: "Omelete")
        inserirPalavra(str: "Frango")
        inserirPalavra(str: "Escondidinho")
        inserirPalavra(str: "Strogonoff")
        inserirPalavra(str: "Batata-palha")
        inserirPalavra(str: "Arroz")
        inserirPalavra(str: "Feijāo")
        inserirPalavra(str: "Torresmo")
        inserirPalavra(str: "Hamburguer")
        inserirPalavra(str: "Sushi")
        inserirPalavra(str: "Salmāo")
        inserirPalavra(str: "Pichana")
        inserirPalavra(str: "Costela")
        inserirPalavra(str: "Pastel")
        inserirPalavra(str: "Repolho")
        inserirPalavra(str: "Panqueca")
        inserirPalavra(str: "Tomate")
        inserirPalavra(str: "Alface")
        inserirPalavra(str: "Lagosta")
        inserirPalavra(str: "Milho")
        inserirPalavra(str: "Calzone")
        inserirPalavra(str: "Bife a parmegianna")
        inserirPalavra(str: "Pāo de queijo")
        inserirPalavra(str: "Kibe")
        inserirPalavra(str: "Maçā")
        inserirPalavra(str: "Brigadeiro")
        inserirPalavra(str: "Bombom")
        inserirPalavra(str: "Chocolate")
        inserirPalavra(str: "Banoff")
        inserirPalavra(str: "Torta de limāo")
        inserirPalavra(str: "Crepes")
        inserirPalavra(str: "Cachorro quente")
        inserirPalavra(str: "Pipoca")
        inserirPalavra(str: "Paçoca")
        inserirPalavra(str: "Quentāo")
        inserirPalavra(str: "Arroz doce")
        inserirPalavra(str: "Canjica")
        inserirPalavra(str: "Peru")
        inserirPalavra(str: "Sagu")
        inserirPalavra(str: "Pé de moleque")
        inserirPalavra(str: "Empada")
        inserirPalavra(str: "Banana")
        inserirPalavra(str: "Abacaxi")
        inserirPalavra(str: "Fondue")
        inserirPalavra(str: "Escargot")
        inserirPalavra(str: "Ameixa")
        inserirPalavra(str: "Uva")
        inserirPalavra(str: "Salsicha/Vina")
        inserirPalavra(str: "Bolacha")
        inserirPalavra(str: "Biscoito")
        inserirPalavra(str: "Batata-frita")
        inserirPalavra(str: "Bacon")
        
        
        
        print("n Palavras: \(PalavraDAO.obterTodos().count)")
        print("n Categoria: \(CategoriaDAO.obterTodos().count)")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.pucpr.TestaBranca" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1] as NSURL
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "TestaBranca", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

