//
//  ViewController.swift
//  DatePicker
//
//  Created by cave dwellers on 2023/08/23.
//

import UIKit

class ViewController: UIViewController {
    // timer
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // selector는 보통 실행할 함수를 뜻한다
        Timer.scheduledTimer(timeInterval:interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    // date picker action function
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        // picker에서 선택한 시간이 label에 표시되도록
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    // timer작동함수
    @objc func updateTime() {
        // lblCurrentTime.text = String(count)
        // count += 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = formatter.string(from: date as Date)
    }
}

