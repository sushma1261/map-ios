//
//  Viewlocation1.swift
//  mapDemo
//
//  Created by SVECW-5 on 06/02/19.
//  Copyright © 2019 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
class Viewlocation1: ViewController,MKMapViewDelegate,CLLocationManagerDelegate{
    @IBOutlet weak var mapv: MKMapView!
    var plat:Double!
    var plong:Double!
    var pname:String!
    
    var mylocation:CLLocationCoordinate2D!
    let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
         mylocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
    }
    
      //var detObj:Details!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1,0.1)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(plat, plong)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        print(plat,plong)
        mapv.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = mylocation
        annotation2.title = "Current Location"
        annotation.coordinate = location
        annotation.title = pname
        mapv.addAnnotation(annotation)
        mapv.addAnnotation(annotation2)

    }
    
    
    func getLat(lat:Double,lon:Double,name:String){
        plat  = lat
        plong = lon
        pname = name
    }
    
}
