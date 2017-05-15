//
//  ViewController.swift
//  test
//
//  Created by Martevol on 5/10/17.
//  Copyright © 2017 Martevol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plus: UITextField!
    @IBOutlet weak var equal: UITextField!
    
    @IBOutlet weak var labelNum1: UILabel!
    @IBOutlet weak var labelNum2: UILabel!
    @IBOutlet weak var labelNum3: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBAr: UIProgressView!
    
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    var time = Timer()
    var num1 = 1
    var num2 = 2
    var numA = 3
    var numB = 3
    var answer = 0
    var num3display = 0
    var score = 0
    var i:Double = 0
    
    var classTinhtoan = tinhtoan()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBAr.progress = Float(i)
        
        
        
        callNumber()
        
        
        
    }

    @IBAction func answerRight(_ sender: Any) {
        runTime()
        if (answer == num3display){
            i = 0
            callNumber()
        } else {
            print("tra loi sai")
            print("display high score: ", score)
        }
    }
    
    @IBAction func answerWrong(_ sender: Any) {
        runTime()
        if(answer != num3display){
            i = 0
            callNumber()
        } else {
            print("tra loi sai")
            print("display high score: ", score)
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
        
        score += 1
        labelScore.text = String(score)


    }
    
    func runTime(){
        time.invalidate()
        time = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        if (i==0){
            i = 1
        } else {
            i -= 0.001
            progressBAr.progress = Float(i)
        }
    }
  
   
    
    
}

