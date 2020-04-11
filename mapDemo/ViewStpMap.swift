//
//  ViewStpMap.swift
//  mapDemo
//
//  Created by DVNAGARAJU on 22/02/19.
//  Copyright © 2019 SVECW-5. All rights reserved.
//

import UIKit
import MapKit
class ViewStpMap: UIViewController,MKMapViewDelegate {
    var latArr = [16.566969,16.568,16.564,16.562,16.567]
    var longArr = [81.525895,81.525895,81.523995,81.523995, 81.523995]
    var titleArr = ["Bhimavaram","Hyd","Surat","1","0"]
    var imageArr = ["greenLoc","RedLoc","img","we","we"]
    var subTitArr = ["1","0","1","1","0"]
    var place = ""
    
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
    
    @IBOutlet weak var map: MKMapView!
   //var color :String = ""
    func showOnMap(lat: Double,long: Double,title: String,c: String, ind: String) {
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            //self.color = c
        //print(self.color)
        print(title)
        self.map.setRegion(region, animated: true)
        let annotpin = customPin(pinTitle: title, pinSubTitle: ind, location: location)
        map.addAnnotation(annotpin)
        self.map.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // showOnMap(lat: 16.566969,long: 81.525895,title: "Bhimavaram",c: "greenLoc",ind: 1)
        //showOnMap(lat: 16.568,long: 81.525895,title: "hyd",c: "redLoc", ind: 2)
        var count = 2
        for i in 0..<5 {
            showOnMap(lat: latArr[i],long: longArr[i],title: titleArr[i],c: imageArr[i],ind: subTitArr[i])
        }
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        var color = ""
        print(annotation.subtitle)
        if(annotation.subtitle == "1") {
            color = "greenLoc"
        }
        else {
            color = "redLoc"
        }
        print(color)
        print("***")
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotation")
        annotationView.image = UIImage(named : color)
        annotationView.canShowCallout = true
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
        place = (view.annotation?.title)! ?? "Hii"
        performSegue(withIdentifier: "detConn", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  detPage: DetailsDisplay = segue.destination as! DetailsDisplay
        detPage.currentObj = self
    }
}
