//
//  SharedItemsViewController.swift
//  
//
//  Created by Ivo Radoslavov on 1/28/17.
//
//

import UIKit

class SharedItemsViewController: UIViewController, UITextFieldDelegate{
    
//Outlets
    
    //item number labels
    
    @IBOutlet weak var item1: UILabel!
    @IBOutlet weak var item2: UILabel!
    @IBOutlet weak var item3: UILabel!
    @IBOutlet weak var item4: UILabel!
    @IBOutlet weak var item5: UILabel!
    @IBOutlet weak var item6: UILabel!
    @IBOutlet weak var item7: UILabel!
    @IBOutlet weak var item8: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    //item amount text fields
    
    @IBOutlet weak var itemAmount1: UITextField!
    @IBOutlet weak var itemAmount2: UITextField!
    @IBOutlet weak var itemAmount3: UITextField!
    @IBOutlet weak var itemAmount4: UITextField!
    @IBOutlet weak var itemAmount5: UITextField!
    @IBOutlet weak var itemAmount6: UITextField!
    @IBOutlet weak var itemAmount7: UITextField!
    @IBOutlet weak var itemAmount8: UITextField!
    
    //item shared with text fields
    
    @IBOutlet weak var itemShared1: UITextField!
    @IBOutlet weak var itemShared2: UITextField!
    @IBOutlet weak var itemShared3: UITextField!
    @IBOutlet weak var itemShared4: UITextField!
    @IBOutlet weak var itemShared5: UITextField!
    @IBOutlet weak var itemShared6: UITextField!
    @IBOutlet weak var itemShared7: UITextField!
    @IBOutlet weak var itemShared8: UITextField!
    
    //helper variables
    
    var oldSegmentedIndex : Int = 0
    var actualSegmentedIndex: Int = 0
    
    var totalSum : Double = 0.0
    
    //setting up Arrays for later
    
    var itemArray = [UILabel]()
    var itemAmountArray = [UITextField]()
    var itemSharedArray = [UITextField]()
    
    //buttons
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var sharedItemsSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var itemsQuestion: UILabel!
    
//Action : Yes or No Shared Items
    
    @IBAction func sharersItemsYesorNo(sender: AnyObject) {
        switch sharedItemsSegmentedControl.selectedSegmentIndex {
            
        case 0 :
            numberOfItemsShared.hidden = false
            itemsQuestion.hidden = false
        
        case 1 :performSegueWithIdentifier("nextScreen", sender: self)
            
        default :
            break;
        }
    }
    
//Action: Number of items Selection
    
    @IBOutlet weak var numberOfItemsShared: UISegmentedControl!
    
    @IBAction func numberOfItemsSelegmentedControl(sender: AnyObject) {
        
        //setting-up Arrays
    
        itemArray = [item1, item2, item3, item4, item5, item6, item7, item8]
        
        itemAmountArray = [itemAmount1, itemAmount2, itemAmount3, itemAmount4, itemAmount5, itemAmount6,itemAmount7,itemAmount8]
        
        itemSharedArray = [itemShared1, itemShared2,itemShared3,itemShared4,itemShared5,itemShared6,itemShared7,itemShared8]
        
        //reveal labels and text fields
        
        oldSegmentedIndex = actualSegmentedIndex
        
        actualSegmentedIndex = numberOfItemsShared.selectedSegmentIndex
        
        if actualSegmentedIndex >= oldSegmentedIndex {
        
        for item in itemArray[0...actualSegmentedIndex] {
            item.hidden = false
        }
        
        for itemAmount in itemAmountArray[0...actualSegmentedIndex] {
            itemAmount.hidden = false
        }
        
        for itemShared in itemSharedArray[0...actualSegmentedIndex] {
            itemShared.hidden = false
        }
        } else {
            
            for item in itemArray[actualSegmentedIndex+1...7] {
                    item.hidden = true
                }
            for itemAmount in itemAmountArray[actualSegmentedIndex+1...7] {
                    itemAmount.hidden = true
                }
            for itemShared in itemSharedArray[actualSegmentedIndex+1...7] {
                    itemShared.hidden = true
            }
        }
}
    
    // Done button + calculating functionality
    
    @IBAction func doneButtonAction(sender: AnyObject) {
        
        let total1 = (Double(itemAmount1.text!) ?? 0.0)/(Double(itemShared1.text!) ?? 1.0)
        
        let total2 = (Double(itemAmount2.text!) ?? 0.0)/(Double(itemShared2.text!) ?? 1.0)
        
        let total3 = (Double(itemAmount3.text!) ?? 0.0)/(Double(itemShared3.text!) ?? 1.0)
        
        let total4 = (Double(itemAmount4.text!) ?? 0.0)/(Double(itemShared4.text!) ?? 1.0)
        
        let total5 = (Double(itemAmount5.text!) ?? 0.0)/(Double(itemShared5.text!) ?? 1.0)
        
        let total6 = (Double(itemAmount6.text!) ?? 0.0)/(Double(itemShared6.text!) ?? 1.0)
        
        let total7 = (Double(itemAmount7.text!) ?? 0.0)/(Double(itemShared7.text!) ?? 1.0)
        
        let total8 = (Double(itemAmount8.text!) ?? 0.0)/(Double(itemShared8.text!) ?? 1.0)
        
        totalSum = total1 + total2 + total3 + total4 + total5 + total6 + total7 + total8
        
        //print(totalSum)
        
        totalLabel.text = String(totalSum)
        
        performSegueWithIdentifier("nextScreen", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set-up arrays
        
        var itemArray = [UILabel]()
        var itemAmountArray = [UITextField]()
        var itemSharedArray = [UITextField]()
        
        itemArray = [item1,item2,item3,item4,item5,item6,item7,item8]
        
        itemAmountArray = [itemAmount1, itemAmount2, itemAmount3, itemAmount4, itemAmount5, itemAmount6,itemAmount7,itemAmount8]
        
        itemSharedArray = [itemShared1, itemShared2,itemShared3,itemShared4,itemShared5,itemShared6,itemShared7,itemShared8]
        
        //hide labels and text fields
        
        for item in itemArray {
            item.hidden = true
        }
        
        for itemAmount in itemAmountArray {
            itemAmount.hidden = true
        }
        
        for itemShared in itemSharedArray {
            itemShared.hidden = true
        }
        
        numberOfItemsShared.selectedSegmentIndex = -1
        
        
        sharedItemsSegmentedControl.selectedSegmentIndex = -1
        
        itemsQuestion.hidden = true
        
        numberOfItemsShared.hidden = true

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var secondScene = segue.destinationViewController as! ViewController
        
        secondScene.totalShared = totalSum
        
        print(totalSum)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
