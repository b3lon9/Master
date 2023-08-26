//
//  ViewController.swift
//  Alert
//
//  Created by cave dwellers on 2023/08/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lampImg: UIImageView!
    
    // load Image
    private let imgOn = UIImage(named:"lamp-on")
    private let imgOff = UIImage(named:"lamp-off")
    private let imgRemove = UIImage(named:"lamp-remove")
    private var isLampOn = true     // 전구가 켜졌는지 꺼졌는지 확인하는 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn
    }


    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn == true) {
            // 전구가 켜져있을 경우 alert를 보이도록 함
            let lampOnAlert =  UIAlertController(title:"경고", message: "현재 On상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            // closer... 익명함수
            /*
             func completeWork(finished:Bool) -> () {
                print("....\(finish)")
             }
             
             {
                (finished:Bool) -> () in
                print("...\(finished)..")
             }
             
             {
                (finished:Bool) in
             }
             */
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler:nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        } else {
            
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.default) {
            ACTION in
            self.lampImg.image = self.imgRemove
            self.isLampOn = false
        }
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

