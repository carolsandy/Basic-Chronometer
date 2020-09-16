//
//  ViewController.swift
//  Chronometer
//
//  Created by Carmen Salvador on 16/09/20.
//  Copyright © 2020 Carmen Salvador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var (hours, minutes, seconds, fractions) = (0, 0, 0, 0)

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fractionsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(keepTimer), userInfo: nil, repeats: true)
            startButton.isEnabled = false
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        startButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        (hours, minutes, seconds, fractions) = (0, 0, 0, 0)
        timeLabel.text = "00:00:00"
        fractionsLabel.text = ".00"
        startButton.isEnabled = true
    }
    
    @objc func keepTimer() {
        fractions += 1
        if fractions > 99 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60 {
            hours += 1
            minutes = 0
        }
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
        
        timeLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
        fractionsLabel.text = ".\(fractions)"
    }
}

