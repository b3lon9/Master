//
//  ViewController.swift
//  Map
//
//  Created by cave dwellers on 2023/08/27.
//

import UIKit
import MapKit

// 지도를 보여주려면 CLLocatioManagerDelegate를 추가해주어야함
class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!     // need MapKit Library
    @IBOutlet var lblLocationInfo1: UILabel!    // 위치에 대한 설명
    @IBOutlet var lblLocationInfo2: UILabel!    // 실제 위치 정보
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 정확도를 최고로 설정함
        locationManager.requestWhenInUseAuthorization()     // 위치 데이터를 추적하기 위해 사용자에게 승인 요구 =
        locationManager.startUpdatingLocation()
        
        myMap.showsUserLocation = true
    }

    // 위도와 경도로 원하는 위치 표시하기
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)   // 위도, 경도
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 범위
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    // Pin위치 조정
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subTitle strSubTitle: String) {
        let annotation = MKPointAnnotation()    // pin을 설치하기 위한 함수
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        myMap.addAnnotation(annotation)
    }

    // 위치가 업데이트 되었을 때 지도에서 위치를 나타내기 위한 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        let pLocation = location.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        //  역으로 위치의 정보, 주소찾기..?
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            
            // 지역 값 존재 확인
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            // 도로 값 존재 확인
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()      // 위치 업데이트 멈춤
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // current location
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            // politec
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subTitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            // eazy campus
            
        }
    }
}

