//
//  DisplayViewController.swift
//  TableSplit
//
//  Created by Ivo Radoslavov on 2/6/17.
//  Copyright © 2017 Ivo Radoslavov. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    //helper variables
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var shared: Double = 0.0
    var individual: Double = 0.0
    var tax: Double = 0.0
    var tip: Double = 0.0
    var grandTotal: Double = 0.0
    
    var totalBillCharged: Double = 0.0
    var taxCharged: Double = 0.0
    
    var key: Bool = true
    
    //Outlets
    
    @IBOutlet weak var grandTotalLabel: UILabel!
    
    @IBOutlet weak var sharedTotalLabel: UILabel!
    @IBOutlet weak var sharedTotalResult: UILabel!
    
    @IBOutlet weak var individualTotalLabel: UILabel!
    @IBOutlet weak var individualTotalResult: UILabel!
    
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var taxResult: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipResult: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    
    @IBAction func infoButtonAction(sender: AnyObject) {

        if key == false {
            sharedTotalResult.hidden = false
            sharedTotalLabel.hidden = false
            individualTotalLabel.hidden = false
            individualTotalResult.hidden = false
            taxLabel.hidden = false
            taxResult.hidden = false
            tipLabel.hidden = false
            tipResult.hidden = false
            key = true
        } else  {
            sharedTotalResult.hidden = true
            sharedTotalLabel.hidden = true
            individualTotalLabel.hidden = true
            individualTotalResult.hidden = true
            taxLabel.hidden = true
            taxResult.hidden = true
            tipLabel.hidden = true
            tipResult.hidden = true
            key = false

        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        key = false
        
        sharedTotalResult.hidden = true
        sharedTotalLabel.hidden = true
        individualTotalLabel.hidden = true
        individualTotalResult.hidden = true
        taxLabel.hidden = true
        taxResult.hidden = true
        tipLabel.hidden = true
        tipResult.hidden = true
        
        print(shared)
        print(individual)
        print(tax)
        print(tip)
        print(grandTotal)
        

        // Do any additional setup after loading the view.
        
        grandTotalLabel.text = "$ " + "\(String(format:"%.2f", grandTotal))"
        sharedTotalResult.text = "$ " + "\(String(format: "%.2f",shared))"
        individualTotalResult.text = "$ " + "\(String(format: "%.2f", individual))"
        taxResult.text = "$ " + "\(String(format: "%.2f", tax))"
        tipResult.text = "$ " + "\(String(format: "%.2f",tip))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var mainScene = segue.destinationViewController as! ViewController
        
        if segue.identifier == "pass" {
            print("We in this bitch")
            
            mainScene.passKey = true
            mainScene.totalBillKey = true
            mainScene.taxKey = true
            mainScene.totalFromPass = totalBillCharged
            mainScene.taxFromPass = taxCharged
            
            print(totalBillCharged)
            print(taxCharged)
        
            //mainScene.totalBill.hidden = false
        } else if segue.identifier == "" {
            
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
