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
    var hackLength : NSTimeInterval?
    var currentDate : NSDate?
    
    func setStartDate(date: NSDate) {
        startDate! = date
    }
    
    func setEndDate(interval: NSTimeInterval) {
        endDate! = startDate!.dateByAddingTimeInterval(interval)
    }
    
    func setHackLength(hours : Int) {
        hackLength! = Double(hours * 3600.0)
    }
    
    
}