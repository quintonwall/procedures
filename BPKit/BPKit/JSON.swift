//
//  JSON.swift
//  BProcedures
//
//  Created by Quinton Wall on 8/22/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import SwiftyJSON

extension JSON {
    public var date: Date? {
        get {
            if let str = self.string {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
                let date = dateFormatter.date(from: str)
                return date
                
            }
            return nil
        }
    }
    
    public var systemdate: Date? {
        get {
            if let str = self.string {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.AAZZZZZ"
                dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
                let date = dateFormatter.date(from: str)
                
                return date
                
            }
            return nil
        }
    }
    
}
