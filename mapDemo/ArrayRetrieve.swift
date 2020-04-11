//
//  ArrayRetrieve.swift
//  mapDemo
//
//  Created by SVECW-5 on 06/12/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class ArrayRetrieve: UIViewController {
    var ref:DatabaseReference!
    var t:Int=0
    var arr:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
       // print("in retrieve")
        var ind:Int = 0
        ref.child("root").observeSingleEvent(of:  .value, with: { snapshot in
            self.t = Int(snapshot.childrenCount)
            
            for i in snapshot.children.allObjects as!  [DataSnapshot]
            {
                let dict = i.value as?  [String:Any]
                let n = dict? ["name"] as? String
                //print("namee")
                //print(n)
                self.arr.insert(n!, at: ind)
               // print(self.arr)
                ind = ind+1
            }
        })
        print("haii")
    }
}
