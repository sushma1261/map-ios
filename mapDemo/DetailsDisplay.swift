//
//  DetailsDisplay.swift
//  mapDemo
//
//  Created by DVNAGARAJU on 23/02/19.
//  Copyright © 2019 SVECW-5. All rights reserved.
//

import UIKit

class DetailsDisplay: UIViewController {

    @IBOutlet weak var Name: UILabel!
    var currentObj:ViewStpMap!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Details Page")
        print(currentObj.place)
        Name.text = currentObj.place
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
