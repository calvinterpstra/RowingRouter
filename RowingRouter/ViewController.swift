//
//  ViewController.swift
//  RowingRouter
//
//  Created by block7 on 2/3/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var routeName: UITextField!
    @IBOutlet weak var routeDate: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer: NSTimer?
    var backgroundTimer: NSTimer?
    var totalSeconds: Int = 0
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    var timerStopped: Bool = true
    
    var array: NSMutableArray? = NSMutableArray()
    var timeTable: TimeTable?

    override func viewDidLoad() {
        super.viewDidLoad()
        timeTable = TimeTable(timeTable: array!, identity: "Calvin")
        backgroundTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "backgroundUpdate", userInfo: nil, repeats: true)
        resetTimer()
    }
    
    @IBAction func startTimer(sender: AnyObject) {
        timerStopped = false
    }
    
    @IBAction func stopTimer(sender: AnyObject) {
        timerStopped = true
    }
    
    @IBAction func restartTimer(sender: AnyObject) {
        resetTimer()
    }
    
    func countUp() {
        seconds += 1
        totalSeconds += 1
        if (seconds == 60) {
            seconds = 0
            minutes++
    
            if (minutes == 60) {
                minutes = 0
                hours++
            }
        }
    }
    
    func resetTimer(){
        //timeAdjustment = elapsedTime!
        seconds = 0
        minutes = 0
        hours = 0
        totalSeconds = 0
    }
    
    func backgroundUpdate(){
        if(!timerStopped){
            countUp()
        }
        timeLabel.text = "\(hours) : \(minutes) : \(seconds)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func printTimeTable(sender: AnyObject) {
        timeTable!.printArray(timeTable!)
    }
    
    @IBAction func addTrip(sender: AnyObject) {
        let time: Int = totalSeconds
        if(routeName.text != nil && routeDate.text != nil){
            let trip = Trip(time: time, routeName: routeName.text!, date: routeDate.text!)
            timeTable!.addRoute(trip)
        }
        resetTimer()
        routeName.text = ""
        routeDate.text = ""
    }

}

