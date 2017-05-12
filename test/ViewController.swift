//
//  ViewController.swift
//  test
//
//  Created by Martevol on 5/10/17.
//  Copyright © 2017 Martevol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelNum1: UILabel!
    @IBOutlet weak var labelNum2: UILabel!
    @IBOutlet weak var labelNum3: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBAr: UIProgressView!
    @IBOutlet weak var test: UIButton!
    
    var time = Timer()
    var num1 = 1
    var num2 = 2
    var num3 = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBAr.progress = 0.0
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        

    }

    @IBAction func testRandom(_ sender: Any) {
        tinhtoan()
    }

    func tinhtoan(){
        num1 = Int(arc4random_uniform(6))
        num2 = Int(arc4random_uniform(6))
        num3 = Int(arc4random_uniform(6))
        labelNum1.text = String(num1)
        labelNum2.text = String(num2)
        labelNum3.text = String(num3)

    }
    
    func updateTimer(){
        progressBAr.progress += 0.1
        label.text = String(format: "%.1f", progressBAr.progress)
    }
  
}

