//
//  CustomTimerPickerViewController.swift
//  Catch Em Being Good POC
//
//  Created by Bonnie Chan on 11/19/16.
//  Copyright © 2016 TsangChan Inc. All rights reserved.
//

import UIKit

class CustomTimerPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var TimePicker: UIPickerView!

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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
