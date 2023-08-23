//
//  ViewController.swift
//  PickerView
//
//  Created by cave dwellers on 2023/08/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRRAY_NUM = 6
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80     // pickerView높이 조정
    var imageArray = [UIImage?]()   // 이미지
    var imageFileName = ["1", "2", "3", "4", "5", "6"]
    /* 빈 배열 선언
     var name = [String]()
     
     name.append("...")
     name.append("..")
     
     */
    
    // delegate를 설정해주어야 함, pickerView에서 선택되었을 때 대신 작업해줄 함수 설정
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }


    // delegate method
    // returns the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // returns the # of rows in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // pickerView에게 컴포넌트의 각 열의 타이틀을 전달하는 함수, 파일명 전달
    // pickerView 미리 나타는 보기 항목이랄까?
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // 위에 텍스트가 아닌 이미지가 미리 나오게 하는 방법
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x:0, y:0, width:100, height:50)
        
        return imageView
    }
    
    // 사용자가 피커뷰의 룰렛을 돌렸을 때 지시하는
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        
        // 이미지 출력
        imageView.image = imageArray[row]
    }
    
    // pickerView 높이 조정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
}

