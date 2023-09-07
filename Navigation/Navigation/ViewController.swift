//
//  ViewController.swift
//  Navigation
//
//  Created by cave dwellers on 2023/09/08.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    
    let imgOn = UIImage(named: "lamp-on")
    let imgOff = UIImage(named: "lamp-off")
    
    var isOn = true
    
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = imgOn
    }

    // prepare함수는 세그웨이(다른 뷰 컨트롤러로 가는 화살표)가
    // 다른 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이다
    // 보통 데이터 전달하기 위해 사용된다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            // button
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            // bar button
            editViewController.textWayValue = "segue : use bar button"
        }
        
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }

    // EidtViewController --message--> ViewController
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOff(_ controller: EditViewController, isOn: Bool) {
        self.isOn = isOn
        
        if isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

