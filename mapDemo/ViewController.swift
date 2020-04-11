                                                //
//  ViewDistance.swift
//  mapDemo
//
//  Created by SVECW-5 on 01/10/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    var lonArr:[Double]  = []
    var latArr:[Double]  = []
    var req:String = "Bike"
    var ref :DatabaseReference!
    var n:Int!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pick: UIPickerView!
    @IBAction func but(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    var pList:[String] = ["Bike","Car"];

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   override func prepare(for  segue: UIStoryboardSegue, sender: Any?){
            let  nextpage: ListView = segue.destination as! ListView
            nextpage.currentObj1 = self
    //print(req)
    
    nextpage.fun(req1:req)
        }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pList[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pList.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = pList[row]
      req = pList[row]
        
    }
       }
