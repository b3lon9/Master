//
//  ViewController.swift
//  Clock
//
//  Created by cave dwellers on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    let date = Date()
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let form = DateFormatter()
        form.timeStyle = .short
        let dateLabel = form.string(from: date)
        
        timeLabel.text = dateLabel 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

