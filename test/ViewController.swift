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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBAr.progress = 0.0
        
//        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.tinhtoan), userInfo: nil, repeats: true)
        
        tinhtoan()
    }

    @IBAction func answerRight(_ sender: Any) {
        if (answer == num3display){
            tinhtoan()
        } else {
            print("tra loi sai")
            print("display high score")
        }
    }
    
    @IBAction func answerWrong(_ sender: Any) {
        if(answer != num3display){
            tinhtoan()
        } else {
            print("tra loi sai")
            print("display high score")
        }
    }

    func tinhtoan(){
        num1 = Int(arc4random_uniform(9))
        num2 = Int(arc4random_uniform(9))
        
        answer = num1 + num2
        numA = answer - 1
        numB = answer + 1
        num3display = randomIntFrom(start: numA, to: numB)
        
        labelNum1.text = String(num1)
        labelNum2.text = String(num2)
        labelNum3.text = String(num3display)

    }
    
    func randomIntFrom(start: Int, to end: Int) -> Int {
        var a = start
        var b = end
        // swap to prevent negative integer crashes
        if a > b {
            swap(&a, &b)
        }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }
    
    func updateTimer(){
        progressBAr.progress += 0.1
        label.text = String(format: "%.1f", progressBAr.progress)
    }
  
    
    
    
}

