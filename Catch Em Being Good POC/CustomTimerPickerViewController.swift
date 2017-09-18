//
//  CustomTimerPickerViewController.swift
//  Catch Em Being Good POC
//
//  Created by Bonnie Chan on 11/19/16.
//  Copyright © 2016 TsangChan Inc. All rights reserved.
//

import UIKit

class CustomTimerPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {

    var timer = Timer()
    var seconds = 2
    var selectedRingtone = "Ringtone 1"
    var selectedHour = 0
    var selectedMinute = 0
    var selectedSeconds = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var TimePicker: UIPickerView!
    @IBOutlet weak var TimerEndsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TimePicker.dataSource = self
        TimePicker.delegate = self
        TimePicker.selectRow(1, inComponent: 2, animated: false)
        
        let hourLabel:UILabel = UILabel()
        hourLabel.frame = CGRect(x: 42, y: TimePicker.frame.size.height/2-15, width: 75, height: 30)
        hourLabel.text = "hours"
        TimePicker.addSubview(hourLabel)
        
        let minuteLabel:UILabel = UILabel()
        minuteLabel.frame = CGRect(x: 42+(TimePicker.frame.size.width/3), y: TimePicker.frame.size.height/2-15, width: 75, height: 30)
        minuteLabel.text = "mins"
        TimePicker.addSubview(minuteLabel)
        
        let secondsLabel:UILabel = UILabel()
        secondsLabel.frame = CGRect(x: 42+((TimePicker.frame.size.width/3)*2), y: TimePicker.frame.size.height/2-15, width: 75, height: 30)
        secondsLabel.text = "secs"
        TimePicker.addSubview(secondsLabel)
        
        self.view.addSubview(TimePicker)
        
        timeLabel.isHidden = true
        
        TimerEndsTable.dataSource = self
        TimerEndsTable.delegate = self
        TimerEndsTable.register(UINib(nibName: "CustomTimerEndsCell", bundle: nil), forCellReuseIdentifier: "TimerEndsCell")
//        let timerEndsCell:CustomTimerEndsCell = (TimerEndsTable.dequeueReusableCell(withIdentifier: "TimerEndsCell")as? CustomTimerEndsCell)!
//        TimerEndsTable.addSubview(timerEndsCell)
//        
        //Register recurring cell xib
        TimerEndsTable.register(UINib(nibName: "CustomRecurringCell", bundle: nil), forCellReuseIdentifier: "RecurringCell")
//        let recurringCell:CustomRecurringCell = (TimerEndsTable.dequeueReusableCell(withIdentifier: "RecurringCell")as? CustomRecurringCell)!
//        TimerEndsTable.addSubview(recurringCell)
//        
        self.view.addSubview(TimerEndsTable)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Timer Picker UI
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0)
        {
            return 25;
        }
        
        return 60;
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30;
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let columnView:UILabel = UILabel()
        columnView.frame = CGRect(x: 35, y: 0, width: self.view.frame.size.width/3-35, height: 30)
        columnView.text = String(row)
        columnView.textAlignment = NSTextAlignment.left
        
        return columnView;
        
    }
    
    //MARK: - Timer Picker Actions
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHour = pickerView.selectedRow(inComponent: 0)
        selectedMinute = pickerView.selectedRow(inComponent: 1)
        selectedSeconds = pickerView.selectedRow(inComponent: 2) + 1
        
        seconds = selectedHour*3600 + selectedMinute*60 + selectedSeconds
        
    }
    
    //MARK: - Timer functions
    @IBAction func cancel(_ sender: UIButton) {
        timer.invalidate()
        timeLabel.isHidden = true
        TimePicker.isHidden = false
        seconds = selectedHour*3600 + selectedMinute*60 + selectedSeconds
    }
    
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc private func countDown()
    {
        seconds -= 1
        timeLabel.text = timeFormatted(totalSeconds: seconds)
        timeLabel.isHidden = false
        TimePicker.isHidden = true
        if(seconds == 0)
        {
            timer.invalidate()
            timeLabel.isHidden = true
            TimePicker.isHidden = false
            seconds = selectedHour*3600 + selectedMinute*60 + selectedSeconds
        }
    }
    
    private func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowRingtoneSegue"
        {
            if let ringtoneVC = segue.destination as? TimerEndsTableViewController {
                //Update Timer Ends table view to add checkmark to saved ringtone value
//                if selectedRingtone.isEmpty{
//                    selectedRingtone = "Ringtone 1"
//                }
                ringtoneVC.selectedRingtone = selectedRingtone
            }
//            print (segue.destination.description)
            
        }
        if segue.identifier == "SaveRingtoneSegue"
        {
            selectedRingtone = "Ringtone 1"
        }
    }
    
    //MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let timerEndsCell:CustomTimerEndsCell = (TimerEndsTable.dequeueReusableCell(withIdentifier: "TimerEndsCell")as? CustomTimerEndsCell)!
            timerEndsCell.detailTextLabel?.text = selectedRingtone
            return timerEndsCell
        }
        else{
            let recurringCell:CustomRecurringCell = (TimerEndsTable.dequeueReusableCell(withIdentifier: "RecurringCell")as? CustomRecurringCell)!
            return recurringCell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            performSegue(withIdentifier: "ShowRingtoneSegue", sender:self)
        }
    }
 
    
    //MARK: - Unwind
    @IBAction func cancelToTimer(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func saveSelectedRingtone(segue:UIStoryboardSegue){
        if let timerEndsVC = segue.source as? TimerEndsTableViewController{
            selectedRingtone = timerEndsVC.selectedRingtone!
            TimerEndsTable.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath)?.detailTextLabel?.text = selectedRingtone
        }
    }
    
    
}
