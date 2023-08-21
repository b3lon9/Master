//
//  ViewController.swift
//  HelloApp
//
//  Created by cave dwellers on 2023/08/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lbHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: UIButton) {
        lbHello.text = "Hello, " + txtName.text!    // optional
    }
}

