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
    
    var time = Timer()
    var num1 = 1
    var num2 = 2
    var numA = 3
    var numB = 3
    var answer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBAr.progress = 0.0
        
        time = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.tinhtoan), userInfo: nil, repeats: true)
        
        tinhtoan()
    }

//    @IBAction func testRandom(_ sender: Any) {
//        tinhtoan()
//    }

    func tinhtoan(){
        num1 = Int(arc4random_uniform(9))
        num2 = Int(arc4random_uniform(9))
        
        answer = num1 + num2
        numA = answer - 1
        numB = answer + 1
        
        labelNum1.text = String(num1)
        labelNum2.text = String(num2)
        labelNum3.text = String(randomIntFrom(start: numA, to: numB))

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

