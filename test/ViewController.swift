//
//  ViewController.swift
//  test
//
//  Created by Martevol on 5/10/17.
//  Copyright © 2017 Martevol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBAr: UIProgressView!
    
    var time = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBAr.progress = 0.0
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)

    }


    
    func updateTimer(){
        progressBAr.progress += 0.1
        label.text = String(format: "%.1f", progressBAr.progress)
    }
  
}

