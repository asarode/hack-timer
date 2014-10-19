//
//  TimerController.swift
//  hackathon-timer
//
//  Created by Arjun Sarode on 10/18/14.
//  Copyright (c) 2014 arjun. All rights reserved.
//

import UIKit

class TimerController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerCollection: UICollectionView!
    
    var blocksFilled : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        timerLabel.text = "FcktShpt"
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 10, height: 10)
//        timerCollection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
//        self.timerCollection.dataSource = self
//        self.timerCollection.delegate = self
        
        self.timerCollection.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.timerCollection.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(timerCollection!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer() {
        timeManager.timeLeft = timeManager.endDate!.timeIntervalSinceDate(NSDate())
        var timeUnits = timeManager.calcTimeUnits()
        
        timerLabel.text = timeUnits["hours"]! + ":" + timeUnits["minutes"]! + ":" + timeUnits["seconds"]!
        
        blocksFilled = Int(50000 * (1-(timeManager.timeLeft / timeManager.hackLength)))
        println(timeManager.timeLeft)
        println(timeManager.hackLength)
        println(blocksFilled)
        
        timerCollection.reloadData()
        
    }
    
    
    
    func collectionView(timerCollection: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50000
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(timerCollection: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = timerCollection.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
        
        if indexPath.item < blocksFilled {
            cell.backgroundColor = UIColor.blueColor()
        } else {
            cell.backgroundColor = UIColor.blackColor()
        }
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
