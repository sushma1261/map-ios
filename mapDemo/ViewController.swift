//
//  ViewDistance.swift
//  mapDemo
//
//  Created by SVECW-5 on 01/10/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit
import FirebaseDatabase
class ViewController: UIViewController,CLLocationManagerDelegate ,UITableViewDelegate,UITableViewDataSource{
    //var nameArr :[String] = ["vtwf","bchj","mkt","jitj","motj","jtoi","mjkgi","nu"]
    //var phnoArr:[String] = ["1","2","3","4","5","6","7","8"]
    var latArr : [Double] = [1,2,3]
    var lonArr : [Double] = [2,2,3]
    var arr:[Double] = [1,2,3,4,5,6,7,7]
    var Sarr:[Double] = [1,2,3,4,5,6,7,88]
    var ref:DatabaseReference!
    var t:Int = 0
    
    
    @IBOutlet weak var tab: UITableView!
    
    var latti:Double!
    var longi :Double!
    let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        
        
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        
        latti = Double(location.coordinate.latitude)
        longi = Double(location.coordinate.longitude)
        //calculating distances...into 'arr'
        //retrieve()
        calDist()
        Sarr.sort()
        // print(Sarr)
        //print(arr)
        tab.delegate = self
        tab.dataSource = self
        tab.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tab.dequeueReusableCell(withIdentifier: "cell1")!  as? CustomCell
        cell?.lab?.text = (String)(Sarr[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    override func prepare(for  segue: UIStoryboardSegue, sender: Any?){
        let  nextpage: Details = segue.destination as! Details
        nextpage.currentObj = self
        
        var  row = (tab.indexPathForSelectedRow? .row)!
        print(Sarr[row])
        print(findInd(dist: Sarr[row]))
        nextpage.fun(index: findInd(dist: Sarr[row]))
    }
    
    func calDist(){
        
        //var i: Int = 0
        let coordinate₀ = CLLocation(latitude: latti, longitude: longi)
        
        for i in 0...lonArr.count-1{
            let  coordinate₁ = CLLocation(latitude: latArr[i], longitude: lonArr[i])
            let x =  coordinate₀.distance(from: coordinate₁)
            
            arr[i] = x
            Sarr[i] = x
            
        }
    }
    func findInd(dist: Double)-> Int  {
        print(dist)
        for i in 0...arr.count-1{
            
            if(dist == arr[i]){
                return i
            }
        }
        return -1
    }
   func retrieve(){
     ref = Database.database().reference()
     ref.child("root").observeSingleEvent(of:  .value, with: { snapshot in
     self.t = Int(snapshot.childrenCount)
     for i in snapshot.children.allObjects as!  [DataSnapshot]
     {
     var ind:Int = 0
     let dict = i.value as?  [String:Any]
     let name = dict? ["name"] as? String
     let phno = dict?["phno"] as? String
     let lon = Double((dict?["lon"] as? String)!)
     let lat = Double((dict?["lat"] as? String)!)
     self.latArr.insert(lat!, at:ind)
     self.lonArr.insert(lon!, at: ind)
    // self.nameArr.insert(name!,at:ind)
    // self.phnoArr.insert(phno!,at:ind)
     
     
     self.tab.reloadData()
     
     ind = ind+1
     }
     
     })
     
     }
}
