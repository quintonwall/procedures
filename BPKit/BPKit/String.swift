//
//  String.swift
//  BProcedures
//
//  Created by Quinton Wall on 8/22/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

extension String {
    func toBool() -> Bool? {
        
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0", "":
            return false
        default:
            return nil
        }
    }
}
