//
//  Details.swift
//  distance
//
//  Created by SVECW-5 on 27/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
class Details: UIViewController {
    @IBOutlet weak var adrl: UILabel!
    @IBOutlet weak var phnol: UILabel!
    @IBOutlet weak var namel: UILabel!
    @IBOutlet weak var idl: UILabel!
  
    
     var phncall:String!
    
   
    @IBAction func callbb(_ sender: Any) {
        (sender as AnyObject).setTitle(phncall,for: .normal)
        if(phncall != ""){
            guard let num = (sender as AnyObject).titleLabel??.text, let url = URL(string : "tel://\(num)") else{
                return
            }
            UIApplication.shared.open(url)
        }
    }
    @IBOutlet weak var callb: UIButton!
    
    @IBAction func GetLocation(_ sender: Any) {
        performSegue(withIdentifier: "getloc", sender: nil)
    }
    var curlong:Double!
    var currentObj:ListView!
    var curname:String!
  override func prepare(for  segue: UIStoryboardSegue, sender: Any?){
        let  nextpage: Viewlocation = segue.destination as! Viewlocation
        nextpage.detObj = self
        // print("in prepare..")
        nextpage.getLat(lat:curlat,lon:curlong,name:curname)
    }
    
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var phno: UILabel!
    @IBOutlet weak var name: UILabel!
    var ref: DatabaseReference!
    var curlat:Double!
    
    var t:Int = 0
    func fun(index :Int){
       // print(index)
         ref = Database.database().reference()
      //  print(index)
        retrieve(idno: index+1)
    }
        
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       ref = Database.database().reference()

    }
    func retrieve(idno :Int){
        //print("in retrieve")
        ref.child("root").observeSingleEvent(of:  .value, with: { snapshot in
            self.t = Int(snapshot.childrenCount)
            //print(snapshot)
            for i in snapshot.children.allObjects as!  [DataSnapshot]
            {
             //print(i.key)
                var idnos :String = String(idno)
                if(i.key == idnos ){
                    
                let dict = i.value as?  [String:Any]
                    //var x = dict?["lat"] as? String
                   // self.curlat = Double(x!)
                    //self.curlong = Double((dict?["lon"] as? String)!)
                  //  print("value of lattt")
                   self.curlat = dict? ["lat"] as? Double
                    self.curlong = dict? ["lon"] as? Double
                    let n = dict? ["name"] as? String
                    let ad = dict?["address"] as? String
                    let p = dict?["phno"] as? String
                    self.phncall = p
                    self.curname = n
                    self.id.text = i.key
                    self.name.text = n
                    self.phno.text = p
                    self.address.text = ad
                    
                }
           
            }
            
        })
        }
    }

