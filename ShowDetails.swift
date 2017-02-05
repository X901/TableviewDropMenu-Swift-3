//
//  ShowDetails.swift
//  TableviewDropMenu
//
//  Created by X901 on 2/5/17.
//  Copyright © 2017 X901. All rights reserved.
//

import UIKit

class ShowDetails: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label.text = List[CountRow]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
