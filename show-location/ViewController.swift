//
//  ViewController.swift
//  show-location
//
//  Created by Salil Biswas on 4/18/19.
//  Copyright © 2019 user150447. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    var latitude: Double?
    var longitude: Double?
    var altitude: Double?
    let locationManager = CLLocationManager()
    @IBOutlet weak var myMap: MKMapView!
    
    @IBOutlet weak var myLatitude: UITextField!
    
    
    @IBOutlet weak var myLongitude: UITextField!
    
    
    @IBOutlet weak var myAltitude: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        if status == .authorizedWhenInUse {
            print("GPS allowed.")
            myMap.showsUserLocation = true
        }
        else {
            print("GPS not allowed.")
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let myCoordinate = locationManager.location?.coordinate
        altitude = locationManager.location?.altitude
        latitude = myCoordinate?.latitude
        longitude = myCoordinate?.longitude
        // change background color to yellow
        self.view.backgroundColor = UIColor.yellow
        //
        myLatitude.text = String(latitude!)
        myLongitude.text = String(longitude!)
        myAltitude.text = String(altitude!)
        // Do any additional setup after loading the view, typically from a nib.
    }

}


