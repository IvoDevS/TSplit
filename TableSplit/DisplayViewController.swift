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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    
    @IBAction func infoButtonAction(_ sender: AnyObject) {

        if key == false {
            sharedTotalResult.isHidden = false
            sharedTotalLabel.isHidden = false
            individualTotalLabel.isHidden = false
            individualTotalResult.isHidden = false
            taxLabel.isHidden = false
            taxResult.isHidden = false
            tipLabel.isHidden = false
            tipResult.isHidden = false
            key = true
        } else  {
            sharedTotalResult.isHidden = true
            sharedTotalLabel.isHidden = true
            individualTotalLabel.isHidden = true
            individualTotalResult.isHidden = true
            taxLabel.isHidden = true
            taxResult.isHidden = true
            tipLabel.isHidden = true
            tipResult.isHidden = true
            key = false

        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        key = false
        
        sharedTotalResult.isHidden = true
        sharedTotalLabel.isHidden = true
        individualTotalLabel.isHidden = true
        individualTotalResult.isHidden = true
        taxLabel.isHidden = true
        taxResult.isHidden = true
        tipLabel.isHidden = true
        tipResult.isHidden = true
        
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let mainScene = segue.destination as! ViewController
        
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
