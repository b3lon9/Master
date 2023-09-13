//
//  ViewController.swift
//  TabTouch
//
//  Created by cave dwellers on 2023/09/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // multi touch override
    // 터치가 시작될 때 사용됨
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch   // 현재 발생한 터치이벤트를 가져옴
        
        txtMessage.text = "Touches Began"           // 현재 발생한 메서드의 이름을 알려줌
        txtTapCount.text = String(touch.tapCount)   // touches 세트 안에 포함된 터치의 개수를 출력
        txtTouchCount.text = String(touches.count)  // 화면에 터치된 개수
    }
    
    // 터치된 손가락이 움직였을 때 호출 됨
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moved"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    // 화면에서 손가락을 떼었을 때 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touched Ended"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
}

