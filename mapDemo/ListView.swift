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
   class ListView: UIViewController,CLLocationManagerDelegate ,UITableViewDelegate,UITableViewDataSource{
       var latArr : [Double] = []
        var lonArr : [Double] = []
          var arr:[Double] = []
        var Sarr:[Double] = []
        var ref:DatabaseReference!
       var t:Int = 0
    var r :String = "nothing"
      @IBOutlet weak var tab: UITableView!
    var currentObj1:ViewController!
    var count :Int = 0
        var latti:Double!
       var longi :Double!
    let manager = CLLocationManager()
      func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
          let location = locations[0]
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    latti = Double(location.coordinate.latitude)
      longi = Double(location.coordinate.longitude)
       // print(" in location manager")
                                                        //calculating distances...into 'arr'
        UserDefaults.standard.set(latti,forKey: "mylatti")
        UserDefaults.standard.set(longi,forKey: "mylongi")
        
     if(latArr.count != 0 && lonArr.count != 0){
    //print("hai")
        //print(lonArr.count)
         calDist()
        count = Sarr.count
      //  print("arr")
        print(arr)
       Sarr.sort()
        print(Sarr)
      print(arr)
        tab.delegate = self
     tab.dataSource = self
        
      tab.reloadData()
   }
 }
                                                    
 override func viewDidLoad() {
  super.viewDidLoad()
    print("in viewdidload")
    ref = Database.database().reference()
    var ind:Int = 0
    ref.child("root").observeSingleEvent(of:  .value, with: { snapshot in
        self.t = Int(snapshot.childrenCount)
        
        for i in snapshot.children.allObjects as!  [DataSnapshot]
        {
            
            let dict = i.value as?  [String:Any]
            let lat = dict? ["lat"] as? Double
            let lon = dict? ["lon"] as? Double
            
            let cat = dict? ["category"] as? String
            print(cat)
            print(self.r)
            if(cat!.contains(self.r)){
                self.latArr.insert(lat!, at: ind)
                self.lonArr.insert(lon!, at: ind)
                ind = ind+1

            }
           
            
            
            print(lat!)
            
                 }
        
    })

    
    
  manager.delegate = self
  manager.desiredAccuracy = kCLLocationAccuracyBest
  manager.requestWhenInUseAuthorization()
  manager.startUpdatingLocation()
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tab.dequeueReusableCell(withIdentifier: "cell1")!  as? CustomCell
         print(Sarr)
    var d = Sarr[indexPath.row]/1000
         cell?.lab?.text = String(d)+"km"
         return cell!
}
                                                    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                 return count
}
                                                    
                                                    
func numberOfSections(in tableView: UITableView) -> Int {
                 return 1
 }
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                   performSegue(withIdentifier: "next1", sender: nil)
}
                                                    
override func prepare(for  segue: UIStoryboardSegue, sender: Any?){
          let  nextpage: Details = segue.destination as! Details
          nextpage.currentObj = self
                 // print("in prepare..")
          var  row = (tab.indexPathForSelectedRow? .row)!
                //  print(Sarr[row])
               //print(findInd(dist: Sarr[row]))
          nextpage.fun(index: findInd(dist: Sarr[row]))
}
                                                    
  func calDist(){
             print(lonArr.count)
             //var i: Int = 0
              let coordinate₀ = CLLocation(latitude: latti, longitude: longi)
                arr.removeAll()
                Sarr.removeAll()
              for i in 0...lonArr.count-1{
                      print(i)
            
                      let  coordinate₁ = CLLocation(latitude: self.latArr[i], longitude:self.lonArr[i])
                     let x =  coordinate₀.distance(from: coordinate₁)
                      arr.insert(x, at: i)
                      Sarr.insert(x, at: i)
               }
    print(Sarr)
    
}
    func findInd(dist: Double)-> Int  {
                                                        //print(dist)
         for i in 0...arr.count-1{
                                                            
                if(dist == arr[i]){
                return i
                }
          }
        return -1
      }
    func fun(req1:String ){
        print("in fun")
        r = req1
        print(r)
      
    }
    
 }
