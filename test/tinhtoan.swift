//
//  tinhtoan.swift
//  test
//
//  Created by Martevol on 5/14/17.
//  Copyright © 2017 Martevol. All rights reserved.
//

import Foundation

class tinhtoan{
    
    func randomIntFrom(start: Int, to end: Int) -> Int {
        var a = start
        var b = end
        // swap to prevent negative integer crashes
        if a > b {
            swap(&a, &b)
        }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }

    
}
