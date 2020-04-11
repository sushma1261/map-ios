//
//  locatePos.swift
//  mapDemo
//
//  Created by SVECW-5 on 17/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class locatePos: UIViewController {
    
    var longi:Double = 0
    var latti:Double = 0
    
    @IBOutlet weak var mapV: MKMapView!
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
            let location = CLLocationCoordinate2DMake(16.567060,81.522192)
            let span = MKCoordinateSpanMake(0.2,0.2)
            let region = MKCoordinateRegion(center: location, span:span )
            mapV.setRegion(region , animated : true)
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = location
            dropPin.title = "shri vishnu engineering college for women"
            dropPin.subtitle = "c-block"
            mapV.addAnnotation(dropPin)

            }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
