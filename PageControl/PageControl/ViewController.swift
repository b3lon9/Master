//
//  ViewController.swift
//  PageControl
//
//  Created by cave dwellers on 2023/08/27.
//

import UIKit

var images = ["1", "2", "3", "4", "5", "6"]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 전체 페이지의 수
        pageControl.numberOfPages = images.count
        
        // 현재 페이지
        pageControl.currentPage = 0
        
        // 페이지를 표시하는 부분 색상
        pageControl.pageIndicatorTintColor = UIColor.green
        
        // 페이지 컨트롤에서 현재 페이지를 표시하는 색상
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
}

