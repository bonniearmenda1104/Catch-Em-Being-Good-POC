//
//  FirstViewController.swift
//  Catch Em Being Good POC
//
//  Created by Bonnie Chan on 11/7/16.
//  Copyright © 2016 TsangChan Inc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var timer = Timer()
    var seconds = 60
    
    
    @IBOutlet weak var timeSelector: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func timeSelection(_ sender: UIDatePicker)
    {
        seconds = Int(sender.countDownDuration)
        timeLabel.text = timeFormatted(totalSeconds: seconds)
    }
    
    @IBAction func cancel(_ sender: UIButton)
    {
        timer.invalidate()
        timeLabel.isHidden = true
        timeSelector.isHidden = false
    }
    
    @IBAction func start(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc private func countDown()
    {
        seconds -= 1
        timeLabel.text = timeFormatted(totalSeconds: seconds)
        timeSelector.isHidden = true
        timeLabel.isHidden = false
        if(seconds == 0)
        {
            timer.invalidate()
            timeLabel.isHidden = true
            timeSelector.isHidden = false
        }
    }
    
    private func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.isHidden = true
        timeSelector.countDownDuration = 60.0;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

