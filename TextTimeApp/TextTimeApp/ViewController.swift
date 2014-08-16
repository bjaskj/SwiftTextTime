//
//  ViewController.swift
//  TextTimeApp
//
//  Created by Bjarte Skjørestad on 16/08/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

import UIKit
import TextTime

class ViewController: UIViewController {
    @IBOutlet var labelTextTime: UILabel!
    let textTimeConverter = TextTimeConverter()
    var timer = NSTimer()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        setTime()
    }
    
    func update() {
        setTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTime() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        
        let firstText = textTimeConverter.convertNumber(hour, hour: true)
        let secondText = textTimeConverter.convertNumber(minutes, hour: false)
        
        labelTextTime.text = "\(firstText)\n\(secondText)"
        labelTextTime.sizeToFit()
    }
}

