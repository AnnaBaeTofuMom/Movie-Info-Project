//
//  MapViewController.swift
//  SeSacDay13Project
//
//  Created by 경원이 on 2021/10/24.
//

import UIKit
import MapKit
import CloudKit
import CoreLocation
import CoreLocationUI

class MapViewController: UIViewController {
    @IBOutlet var locationSearchBar: UISearchBar!
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    
    
    //1. LocationManager 인스턴스 만들어주기
    let locationManager = CLLocationManager()
    
    
    func getUserLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "내 현재 위치"
        locationManager.delegate = self
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: CLLocationManagerDelegate {
    
}


