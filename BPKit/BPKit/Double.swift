//
//  Double.swift
//  BProcedures
//
//  Created by Quinton Wall on 8/25/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import Foundation


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
