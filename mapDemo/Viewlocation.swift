//
//  Viewlocation.swift
//  mapDemo
//
//  Created by SVECW-5 on 06/02/19.
//  Copyright © 2019 SVECW-5. All rights reserved.
//

//
//  Viewlocation.swift
//  mapDemo
//
//  Created by SVECW-5 on 30/01/19.
//  Copyright © 2019 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class customPin:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String,pinSubTitle:String,location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
        
    }
}

class Viewlocation: UIViewController,MKMapViewDelegate{
    var plat :Double!
    var plong :Double!
    var pname:String!
    
    var mylat:Double!
    var mylon:Double!
    
    var detObj:Details!
    
    
    @IBOutlet weak var mapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let curlat:Double = (UserDefaults.standard.value(forKey: "mylatti")as! Double)
        {
            mylat = curlat
        }
        
        if let curlon:Double = (UserDefaults.standard.value(forKey: "mylongi")as! Double)
        {
            mylon = curlon
        }
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1,0.1)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(plat, plong)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        print(plat,plong)
        mapview.setRegion(region, animated: true)
        
        //lat 16.566969
        //lon 81.525895
        
        let sourceLocation = CLLocationCoordinate2D(latitude:  16.566969, longitude: 81.525895)
        
        let destinationLocation = CLLocationCoordinate2D(latitude: plat, longitude: plong)
        
        let sourcePin = customPin(pinTitle: "sourcelocation", pinSubTitle: "myloaction", location: sourceLocation)
        
        let destinationPin = customPin(pinTitle: "destinationlocation", pinSubTitle: "current", location: destinationLocation)
        self.mapview.addAnnotation(sourcePin)
        self.mapview.addAnnotation(destinationPin)
        let x = MKPinAnnotationView.self
        x.greenPinColor()
        
        //        sourcePin.provideImageData(<#T##data: UnsafeMutableRawPointer##UnsafeMutableRawPointer#>, bytesPerRow: <#T##Int#>, origin: <#T##Int#>, <#T##y: Int##Int#>, size: <#T##Int#>, <#T##height: Int##Int#>, userInfo: <#T##Any?#>)
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation)
        
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirectionsRequest()
        
        directionRequest.source = MKMapItem(placemark: sourcePlacemark)
        
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        
        directionRequest.transportType = .automobile
        
        let directions  = MKDirections(request: directionRequest)
        directions.calculate {(response,error) in
            guard let directionResponse = response else{
                if let error = error {
                    print("we have error getting directions==\(error.localizedDescription)")
                }
                return
                
            }
            let route  = directionResponse.routes[0]
            self.mapview.add(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapview.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        self.mapview.delegate = self
        
        /*let annotation = MKPointAnnotation()
         let annotation2 = MKPointAnnotation()
         annotation.coordinate = location
         annotation.title = pname
         mapview.addAnnotation(annotation)
         
         
         annotation2.coordinate = CLLocationCoordinate2DMake(currentlat, currentlon)
         annotation2.title = "My Location"
         mapview.addAnnotation(annotation2)
         
         let sourcePlace = MKPlacemark(coordinate: location)
         
         print(plat)*/
        
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
    
    
    func getLat(lat:Double,lon:Double,name:String){
        plat  = lat
        plong = lon
        pname = name
    }
}

