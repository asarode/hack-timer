//
//  TimeMangager.swift
//  hackathon-timer
//
//  Created by Arjun Sarode on 10/18/14.
//  Copyright (c) 2014 arjun. All rights reserved.
//

import UIKit

var timeManager : TimeManager = TimeManager()

class TimeManager : NSObject {
    
    var startDate : NSDate?
    var endDate : NSDate?
    var hackLength : NSTimeInterval = 12*3600
    var currentDate : NSDate?
    var timeLeft : NSTimeInterval = 0
    
    func setStartDate(date: NSDate) {
        startDate! = date
    }
    
    func setEndDate(interval: NSTimeInterval) {
        endDate! = startDate!.dateByAddingTimeInterval(interval)
    }
    
    func setHackLength(hours : Int) {
        hackLength = Double(hours * 3600.0)
    }
    
    func calcTimeUnits() -> [String:String] {
        var formatHours : String?
        var formatMinutes : String?
        var formatSeconds : String?
        
        let hours = Int(timeLeft / 3600)
        if hours < 10 {
            formatHours = "0"+String(hours)
        } else {
            formatHours = String(hours)
        }
        
        let minutes = Int((timeLeft - Double(hours * 3600)) / 60)
        if minutes < 10 {
            formatMinutes = "0"+String(minutes)
        } else {
            formatMinutes = String(minutes)
        }
        
        let seconds = Int((timeLeft - Double(hours*3600) - Double(minutes*60)))
        if seconds < 10 {
            formatSeconds = "0"+String(seconds)
        } else {
            formatSeconds = String(seconds)
        }
        
        var timeUnits : [String:String] = ["hours": formatHours!, "minutes": formatMinutes!, "seconds": formatSeconds!]
        
        return timeUnits
        
    }
    
//    init(date: NSDate) {
//        startDate = date
//    }
//    
//    override convenience init() {
//        self.init(date: NSDate())
//    }
    
}