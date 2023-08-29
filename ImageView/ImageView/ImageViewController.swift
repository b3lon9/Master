//
//  ViewController.swift
//  ImageView
//
//  Created by cave dwellers on 2023/08/21.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false  // 확대여부
    var imgOn:UIImage?      // 켜진 전구 이미지를 가진 변수
    var imgOff:UIImage?     // 꺼진 전구 이미지를 가진 변수
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // image지정
        imgOn = UIImage(named: "lamp_on")
        imgOff = UIImage(named: "lamp_off")
        
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat     // 2배로 확대할 것 2.0
        
        if (isZoom) {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            
            btnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

