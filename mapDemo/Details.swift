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
   var ref:DatabaseReference!
   var currentObj:ViewController!
    var t:Int = 0
    
    
    
    
    func fun(index :Int){
        print(index)
        ref = Database.database().reference()
        ref.child("root").observeSingleEvent(of:  .value, with: { snapshot in
            //self.t = Int(snapshot.childrenCount)
            print(snapshot)
            /*for i in snapshot.children.allObjects as!  [DataSnapshot]
            {
                var ind:Int = 0
                let dict = i.value as?  [String:Any]
                //print(dict)
                /*let name = dict? ["name"] as? String
                let phno = dict?["phno"] as? String
                //let lon = Double((dict?["lon"] as? String)!)
                //let lat = Double((dict?["lat"] as? String)!)
                print(name)
                ind = ind+1*/
            }*/
            
        })

    }
        
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
   }
