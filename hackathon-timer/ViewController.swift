//
//  ViewController.swift
//  hackathon-timer
//
//  Created by Arjun Sarode on 10/18/14.
//  Copyright (c) 2014 arjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var hackDatePicker: UIDatePicker!
    @IBOutlet weak var hackLengthPicker: UIPickerView!
    @IBAction func launchButton(sender: UIButton) {
        endDate = calcEndDate()
        timeManager.endDate = endDate
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? TimerController {
            let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: destination, selector: "updateTimer", userInfo: nil, repeats: true)
        }
    }
    
    func calcEndDate() -> NSDate {
        let hackDate = hackDatePicker.date

        let interval = Double(hackLength! * 3600.0)
        
        let endDate = hackDate.dateByAddingTimeInterval(interval)
        
        return endDate
       
    }
    
    var hackLengths : Array<Int>?
    var hackStart : NSDate?
    var hackLength : Int?
    var endDate : NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.hackLengthPicker.dataSource = self
        self.hackLengthPicker.delegate = self
        
        hackLengths = [12, 24, 36]
        hackLength = hackLengths![0]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns number of 'columns' to display.
    func numberOfComponentsInPickerView(hackLengthPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(hackLengthPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hackLengths!.count;
    }
    
    func pickerView(hackLengthPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(hackLengths![row])
    }
    
    func pickerView(hackLengthPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hackLength = hackLengths![row]
        println(hackLengths![row])
    }
    

}

