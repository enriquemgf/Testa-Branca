//
//  GamePlayVC.swift
//  FinalProject
//
//  Created by Enrique  Martinez on 22/06/16.
//  Copyright © 2016 Enrique  Martinez. All rights reserved.
//

import UIKit
import CoreMotion
import QuartzCore

import AudioToolbox
import AVFoundation

class GamePlayVC: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var DisplayLabel: UILabel!
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    let corJogadores = [
        "Vermelho": UIColor.init(red: 255.0/255, green: 39.0/255, blue: 64.0/255, alpha: 1.0),
        "Verde": UIColor.init(red: 0.0/255, green: 218.0/255, blue: 34.0/255, alpha: 1.0),
        "Amarelo": UIColor.init(red: 254.0/255, green: 218.0/255, blue: 30.0/255, alpha: 1.0),
        "Azul": UIColor.init(red: 3.0/255, green: 235.0/255, blue: 254.0/255, alpha: 1.0),
        "Rosa": UIColor.init(red: 255.0/255, green: 88.0/255, blue: 252.0/255, alpha: 1.0)]
    var jogadores:[(nome:String,cor:String)] =  []
    
    let correctSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "correct", ofType: "wav")!)
    let errorSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "error", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    
    //var arrayPalavras:[String] = ["Elefante","Macaco", "Touro", "Cavalo", "Ornitorrinco", "Pica-Pau", "Cachorro", "Gato", "Mamute", "Mosca","Rinoceronte", "Arara", "Girafa", "Leão", "Tigre", "Gorila", "Cobra", "Cágado", "Camaleão", "Tartaruga", "Peixe-Palhaço", "Hiena", "Carangueijo"]
    var arrayPalavras:[String] = []
    
    var palavrasJogadas:[(String,Bool)] = []
    var controle:Bool = true
    
    @IBOutlet weak var feedback: UIImageView!
    var gameTimer:Timer!
    var count = 65
    override func viewDidLoad() {
        super.viewDidLoad()
        //configure screen
        DisplayLabel.adjustsFontSizeToFitWidth = true
        switch jogadores[0].cor{
        case "Azul":
            bgImg.image = UIImage(named: "azulBG")
            break
        case "Verde":
            bgImg.image = UIImage(named: "verdeBG")
            break
        case "Amarelo":
            bgImg.image = UIImage(named: "amareloBG")
            break
        case "Rosa":
            bgImg.image = UIImage(named: "rosaBG")
            break
        case "Vermelho":
            bgImg.image = UIImage(named: "vermelhoBG")
            break
        default:
            break
        }
        jogadores.removeFirst()
        
        feedback.alpha = 0.0
        
        
        //start gyro
        if motionManager.isGyroAvailable {
            motionManager.deviceMotionUpdateInterval = 0.2;
            motionManager.gyroUpdateInterval = 0.2
            
            
            
            gameTimer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
            timerLabel.layer.cornerRadius = 20
            timerLabel.layer.masksToBounds = true
            
   
            
        } else {
            let alert = UIAlertController(title: "No gyro", message: "Get a Gyro", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func updateClock(){
        if count <= 60 {
            countDownLabel.alpha = 0.0
            if count > 0 {
                count -= 1
                timerLabel.text = "\(count)"
            }else{
                //restart game
                if jogadores.count > 0{
                    switch jogadores[0].cor{
                        case "Azul":
                        bgImg.image = UIImage(named: "azulBG")
                        break
                        case "Verde":
                        bgImg.image = UIImage(named: "verdeBG")
                        break
                        case "Amarelo":
                        bgImg.image = UIImage(named: "amareloBG")
                        break
                        case "Rosa":
                        bgImg.image = UIImage(named: "rosaBG")
                        break
                        case "Vermelho":
                        bgImg.image = UIImage(named: "vermelhoBG")
                        break
                        default:
                        break
                    }
                    
                    DisplayLabel.text = "Coloque o celular na testa"
                    countDownLabel.alpha = 1.0
                    countDownLabel.text = "5"
                    timerLabel.text = "60"
                    count = 65
                    jogadores.removeFirst()
                }else {
                    DisplayLabel.text = "Fim de jogo"
                    motionManager.stopGyroUpdates()
                    backButton.isHidden = false
                }
                
                
            }
        }else {
            count -= 1
            countDownLabel.text = "\(count-60)"
        }
        if count == 60 {
            startGyroUpdate()
            generateFirstWord()
        }
    }
    
    
    func startGyroUpdate(){
        motionManager.startDeviceMotionUpdates()

        motionManager.startGyroUpdates(to: OperationQueue.main, withHandler: { (gyroData, NSError) -> Void in
            self.tryRotation(rotation: gyroData!.rotationRate)
        })
    }
    func degrees(fromRadians radians: Double) -> Double {
        return 180 * radians / Double.pi
    }
    
    func tryRotation(rotation:CMRotationRate){
        
        var attitude = CMAttitude()
        if let motion = motionManager.deviceMotion {
            attitude = motion.attitude
            let rollRate = degrees(fromRadians: attitude.roll)
            print(rollRate)
            
            if fabs(rollRate) > 68 && fabs(rollRate) < 93 && !controle {
                controle = true
            }
            if fabs(rollRate) < 20 && controle{
                controle = false
                generateNewWord()
                //motionManager.stopGyroUpdates()
            }
            else if fabs(rollRate) > 135 && controle{
                controle = false
                generateNextWord()
                //motionManager.stopGyroUpdates()
            }
        }
    }
    func generateFirstWord(){
        
        let index =  arc4random_uniform(UInt32(self.arrayPalavras.count))
        let palavra = self.arrayPalavras[Int(index)]
        self.arrayPalavras.remove(at: Int(index))
        self.DisplayLabel.text = palavra
        
    }
    
    func generateNewWord(){

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: errorSound as URL, fileTypeHint: nil)
        } catch {
            print("No sound found by URL:\(errorSound)")
        }
        
        audioPlayer.prepareToPlay()
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        self.feedback.image = UIImage(named: "error")
        self.feedback.alpha = 1.0
        if Singleton.sharedInstance.sound{
            self.audioPlayer.play()
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.showHideTransitionViews, animations: {
            self.feedback.alpha = 0.0
            }) { (true) in
                //salva palavra acertada
            self.palavrasJogadas.append(("\(String(describing: self.DisplayLabel.text))",false))
                
                //gera nova palavra
                let index =  arc4random_uniform(UInt32(self.arrayPalavras.count))
                let palavra = self.arrayPalavras[Int(index)]
                self.arrayPalavras.remove(at: Int(index))
                self.DisplayLabel.text = palavra
        }
    }

    
    func generateNextWord(){
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: correctSound as URL, fileTypeHint: nil)
        } catch {
            print("No sound found by URL:\(correctSound)")
        }
            
        audioPlayer.prepareToPlay()
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        self.feedback.image = UIImage(named: "right")
        self.feedback.alpha = 1.0
        if Singleton.sharedInstance.sound{
            self.audioPlayer.play()
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIView.AnimationOptions.showHideTransitionViews, animations: {
            self.feedback.alpha = 0.0
        }) { (true) in
            //salva palavra acertada
            self.palavrasJogadas.append(("\(String(describing: self.DisplayLabel.text))",true))
            
            //gera nova palavra
            let index =  arc4random_uniform(UInt32(self.arrayPalavras.count))
            let palavra = self.arrayPalavras[Int(index)]
            self.arrayPalavras.remove(at: Int(index))
            self.DisplayLabel.text = palavra
        }
    }
    
    @IBAction func goBack(sender: UIButton) {
        
        //save score, then go back
        performSegue(withIdentifier: "backToCategories", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

