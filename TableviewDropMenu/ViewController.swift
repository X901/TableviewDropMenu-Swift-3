//
//  ViewController.swift
//  TableviewDropMenu
//
//  Created by X901 on 9/30/16.
//  Copyright © 2016 X901. All rights reserved.
//

import UIKit
import DynamicButton


var List = [String]()
var CountRow:Int = 0



class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var backgroundView: UIView!
    

    override func viewWillAppear(_ animated: Bool) {
        
     Titles.text = ""
        
 
    }
    
 

    @IBOutlet weak var DButtonOutlet: DynamicButton!
    
 
        
        
    

    
    @IBAction func dynamicButton(_ sender: DynamicButton) {
    
DropButton(sender)

    }
    
    
    @IBOutlet weak var Titles: UILabel!
    
    @IBOutlet weak var DropList: UITableView!
    
    @IBOutlet weak var ViewBloewTable: UIView!

    
    
    @IBAction func DropButton(_ sender: AnyObject) {
        
        if DropList.isHidden == true && ViewBloewTable.isHidden == true {
            
            showDropMenu()

            
        }
        
        else {
            
            hideDropMenu()
        
    }
    
    }
    
    func hideDropMenu(){
        
        UIView.transition(with: DropList,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations:
            { () -> Void in
                self.DropList.reloadData()
        },
                          completion: nil);
        
        DropList.isHidden = true
        ViewBloewTable.isHidden = true
        
        DButtonOutlet.setStyle(DynamicButtonStyle.caretDown, animated: true)
        
        
    }
    
    func showDropMenu(){
        
        UIView.transition(with: DropList,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations:
            { () -> Void in
                self.DropList.reloadData()
        },
                          completion: nil);
        
        DropList.isHidden = false
        ViewBloewTable.isHidden = false
        
        DButtonOutlet.setStyle(DynamicButtonStyle.caretUp, animated: true)
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //  Add TapGesture when clicked anywhere in viewcontroller
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        
        backgroundView.addGestureRecognizer(tap)
        
        backgroundView.isUserInteractionEnabled = true
        
        

        // Add Arrow Down icon
        DButtonOutlet.setStyle(DynamicButtonStyle.caretDown, animated: false)

        // Add shadow around DropMenu
        ViewBloewTable.layer.shadowColor = UIColor.black.cgColor
        ViewBloewTable.layer.shadowOpacity = 0.4
        ViewBloewTable.layer.shadowOffset = CGSize.zero
        ViewBloewTable.layer.shadowRadius = 1

    DropList.isHidden = true
        ViewBloewTable.isHidden = true
        
        
       // DropMenu List
                List = ["1","2","3","4","5","6","7","8","9","10"]
                
            
            
       

    }
    
    // function which is triggered when handleTap is called
    // Hide DropMenu when clicked anywhere
    func handleTap(_ sender: UITapGestureRecognizer) {

        hideDropMenu()
        
    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return List.count
        

    }
    
    
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = DropList.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCellNames
        
        
        cell.ListNames.text = List[indexPath.row]
        
        
        
        return cell
        
    }
    
    
    
   

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        CountRow = indexPath.row
        
        
       Titles.text = List[indexPath.row]
      
// Hide drop Menu when selecting Cell
     hideDropMenu()
        

        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40;//Choose your custom row height
    }

    



}

