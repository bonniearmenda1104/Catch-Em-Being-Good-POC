//
//  FirstViewController.swift
//  Catch Em Being Good POC
//
//  Created by Bonnie Chan on 11/7/16.
//  Copyright © 2016 TsangChan Inc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


    var currentTime = 0
    var stopwatchTimer = Timer()
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBAction func startClicked(_ sender: Any) {
        
        startBtn.isHidden = true
        stopBtn.isHidden = false
        resetBtn.isEnabled = true
        
        stopwatchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(FirstViewController.updateTime)), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopClicked(_ sender: Any) {
        stopBtn.isHidden = true
        startBtn.isHidden = false
        
        stopwatchTimer.invalidate()
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        stopBtn.isHidden = true
        startBtn.isHidden = false
        resetBtn.isEnabled = false
        
        stopwatchTimer.invalidate()
        
        currentTime = 0
        timeLbl.text = "00:00"
        
    }
    
    @objc private func updateTime()
    {
        currentTime += 1
        
        if currentTime == 3600000
        {
            //reached an hour, let's reset
            currentTime = 0
            
        }
        //let millisecs: Int = currentTime % 100
        let seconds: Int = currentTime % 60
        let minutes: Int = currentTime / 60
        timeLbl.text = String(format: "%02d:%02d", minutes, seconds)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopBtn.isHidden = true
        resetBtn.isEnabled = false
        
        timeLbl.text = "00:00"
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

