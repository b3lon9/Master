//
//  ViewController.swift
//  DrawGraphics
//
//  Created by cave dwellers on 2023/09/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // 선 그리기 기능 구현
    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)     // context를 이미지 뷰의 크기와 같게 생성함 canvas같은 건가...
        let context = UIGraphicsGetCurrentContext()         // 생성한 cocntext의 정보를 가져옴
        
        // Draw Line
        context?.setLineWidth(2.0)                      // 선의 굵기를 2.0
        context?.setStrokeColor(UIColor.red.cgColor)    // context의 선색상..?
        
        context?.move(to: CGPoint(x:70, y:50))          // 커서를 옮김
        context?.addLine(to: CGPoint(x: 270, y:250))    // 현재 위치에서 지정한 위치까지 선을 그음
        
        context?.strokePath()   // 7. context에 그리는 것
        
        
        // Draw Triangle
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        
        context?.move(to: CGPoint(x: 170, y:200))
        context?.addLine(to: CGPoint(x: 270, y: 350))
        context?.addLine(to: CGPoint(x: 70, y: 350))
        context?.addLine(to: CGPoint(x: 170, y: 200))
        context?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 현재 context에서 그려진 이미지를 가지고 와서 이미지 뷰에 나타냄
        UIGraphicsEndImageContext()     // 그리기 끝
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setStrokeColor(UIColor.red.cgColor)
        
        context?.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        context?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        // Draw Ellipse
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        
        context?.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))      // x, y위치에서 타원을 그림
        context?.strokePath()
        
        // Draw Circle
        context?.setLineWidth(5.0)
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))
        context?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(5.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        
        // Draw Arc
        context?.move(to: CGPoint(x: 100, y: 50))
        context?.addArc(tangent1End: CGPoint(x: 250, y: 200), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context?.addLine(to: CGPoint(x: 250, y: 200))
        
        context?.move(to: CGPoint(x: 100, y: 250))
        context?.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context?.addLine(to: CGPoint(x: 100, y: 400))
        
        context?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // 가득채우기
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        // Draw Rectangle
        context?.setLineWidth(1.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context?.addRect(rectangle)
        context?.fill(rectangle)
        context?.strokePath()
        
        // Draw Circle
        context?.setLineWidth(1.0)
        // context?.setStrokeColor(<#T##color: CGColor##CGColor#>)
    }
}

