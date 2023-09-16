//
//  ViewController.swift
//  SwipeGesture
//
//  Created by cave dwellers on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    
    // 각 방향별 검정, 빨강색 이미지를 저장하기 위해 배열로 선언
    var imgLeft = [UIImage]()
    var imgUp = [UIImage]()
    var imgRight = [UIImage]()
    var imgDown = [UIImage]()
    
    let numOfTouches = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // image할당
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named:"arrow-left-red.png")!)
        
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        
        // multi swipe color
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        
        // 각 이미지에 이미지뷰 할당
        imgViewLeft.image = imgLeft[0]
        imgViewUp.image = imgUp[0]
        imgViewRight.image = imgRight[0]
        imgViewDown.image = imgDown[0]
        
        
        // swipe
        //let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        // swipeLeft.numberOfTouchesRequired = numOfTouches
        swipeLeftMulti.numberOfTouchesRequired = numOfTouches
        // swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        
        // self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        
        // let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        // swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        //swipeUp.numberOfTouchesRequired = numOfTouches
        swipeUpMulti.numberOfTouchesRequired = numOfTouches
        // self.view.addGestureRecognizer(swipeUp) // 위쪽 제스쳐...?
        self.view.addGestureRecognizer(swipeUpMulti) // 위쪽 제스쳐...?
        
        // let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        // swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        // swipeRight.numberOfTouchesRequired = numOfTouches
        swipeRightMulti.numberOfTouchesRequired = numOfTouches
        // self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeRightMulti)
        
        // let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        // swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        // swipeDown.numberOfTouchesRequired = numOfTouches
        swipeDownMulti.numberOfTouchesRequired = numOfTouches
        // self.view.addGestureRecognizer(swipeDown)
        self.view.addGestureRecognizer(swipeDownMulti)
    }


    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewLeft.image = imgLeft[0]
            imgViewUp.image = imgUp[0]
            imgViewRight.image = imgRight[0]
            imgViewDown.image = imgDown[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            default:
                break
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            // 처음 초기화 해주는 코드
            imgViewLeft.image = imgLeft[0]
            imgViewUp.image = imgUp[0]
            imgViewRight.image = imgRight[0]
            imgViewDown.image = imgDown[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            default:
                break
            }
        }
    }
}

