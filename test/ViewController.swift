//
//  ViewController.swift
//  test
//
//  Created by Martevol on 5/10/17.
//  Copyright © 2017 Martevol. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var plus: UITextField!
    @IBOutlet weak var equal: UITextField!
    
    @IBOutlet weak var labelNum1: UILabel!
    @IBOutlet weak var labelNum2: UILabel!
    @IBOutlet weak var labelNum3: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelHighscore: UILabel!
    @IBOutlet weak var popupBanner: UIView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBAr: UIProgressView!
    
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    var clickSound = AVAudioPlayer()
    var loseSound = AVAudioPlayer()
    var soundMutes = false
    
    var time = Timer()
    var num1 = 1
    var num2 = 2
    var numA = 3
    var numB = 3
    var answer = 0
    var num3display = 0
    var score = -1
    var highScore = 0
    var i:Double = 0
    var classTinhtoan = tinhtoan()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let highScoreDefault = UserDefaults.standard
        highScore = highScoreDefault.value(forKey: "highScore") as! Int
        labelHighscore.text = String(highScore)
        
        sound()
        
        retryButton.isHidden = true
        
        progressBAr.progress = Float(i)
        
        callNumber()
        
        
//        popupBanner.isHidden = true
        
    }
    
    
    func setHighscore(){
        
        score += 1
        labelScore.text = String(score)
        if (score > highScore)
        {
            highScore = score
            let highScoreDefault = UserDefaults.standard
            highScoreDefault.set(highScore, forKey: "highScore")
            highScoreDefault.synchronize()
        }
    }

    @IBAction func retryButton(_ sender: Any) {
        score = -1
        i = 1
        progressBAr.progress = Float(i)
        
        callNumber()
        time.invalidate()
        
        rightButton.isHidden = false
        wrongButton.isHidden = false
        //        popupBanner.isHidden = true
    }
    
    @IBAction func answerRight(_ sender: Any) {
        runTime()
        if (answer == num3display){
            clickSound.play()
            i = 1
            callNumber()
        } else {
            lose()
        }
    }
    
    @IBAction func answerWrong(_ sender: Any) {
        runTime()
        if(answer != num3display){
            clickSound.play()
            i = 1
            callNumber()
        } else {
            lose()
        }
    }

    func callNumber(){
        num1 = Int(arc4random_uniform(9))
        num2 = Int(arc4random_uniform(9))
        
        answer = num1 + num2
        numA = answer - 1
        numB = answer + 1
        num3display = classTinhtoan.randomIntFrom(start: numA, to: numB)
        
        labelNum1.text = String(num1)
        labelNum2.text = String(num2)
        labelNum3.text = String(num3display)
        
        setHighscore()
        


    }
    
    func runTime(){
        time.invalidate()
        time = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        if (i<=0){
            lose()
            i = 1
        } else {
            i -= 0.0001
            progressBAr.progress = Float(i)
        }
    }
    
    func lose(){
        loseSound.play()
//        popupBanner.isHidden = false
        time.invalidate()
        rightButton.isHidden = true
        wrongButton.isHidden = true
        retryButton.isHidden = false
        print("tra loi sai")
        print("display high score: ", score)
        
        let highScoreDefault = UserDefaults.standard
        highScore = highScoreDefault.value(forKey: "highScore") as! Int
        labelHighscore.text = String(highScore)


    }
  
    func sound(){
        do{
            clickSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "click", ofType: "wav")!))
            clickSound.volume = 0.1
            clickSound.prepareToPlay()
            
            loseSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "lose", ofType: "wav")!))
            loseSound.prepareToPlay()

        }
        catch {
            print(error)
        }
    }
   
    @IBAction func soundSetting(_ sender: Any) {
        if (!soundMutes)
        {
            clickSound.volume = 0
            loseSound.volume = 0
            soundButton.setImage(UIImage(named: "mute"), for: UIControlState.normal)
            soundMutes = true
        }
        else {
            clickSound.volume = 0.2
            loseSound.volume = 0.2
            soundButton.setImage(UIImage(named: "speaker"), for: UIControlState.normal)
            soundMutes = false
        }
        
        
        

    }
    
    
}

