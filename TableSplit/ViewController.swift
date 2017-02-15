//
//  ViewController.swift
//  TableSplit
//
//  Created by Ivo Radoslavov on 2/7/16.
//  Copyright © 2016 Ivo Radoslavov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override var shouldAutorotate : Bool {
        return false
    }
    
    var passKey: Bool = false
    var totalBillKey: Bool = false
    var taxKey: Bool = false
    
    var totalShared: Double = 0.0
    var individual: Double = 0.0
    var sum: Double = 0.0
    var taxOwed: Double = 0.0
    var tipOwed: Double = 0.0
    var grandTotalOwed: Double = 0.0
    var total: Double = 0.0
    var taxTotal: Double = 0.0
    
    //from pass segue
    
    var totalFromPass: Double = 0.0
    var taxFromPass: Double = 0.0

    @IBOutlet weak var segueLabel: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var newEntryButtonOutlet: UIButton!
    
    var tipPercent: Double = 0
    
    var oldSegmentedIndex : Int = 0
    var actualSegmentedIndex : Int = 0
    var oldSegmentedSharedIndex : Int = 0
    var actualSegmentedSharedIndex : Int = 0

    var textArray = [UITextField]()
    var labelArray = [UILabel]()
    var anotherLableArray = [UILabel]()
    var labelArrayToShow = [UILabel]()
    
    var sharedItemArray = [UILabel]()
    var sharedItemAmount = [UITextField]()
    var sharedItemPeople = [UITextField]()
    
    var newNumber = 0
    var currentIndex = 0
    var prevIndex = 0
    var tempNumber = 0
    var isSet = false
    var lastNum = 0
    
    var isPressed = false
    
    
    //Outlets
    
    //Sharing
    
    @IBOutlet weak var sharingYesorNo: UISegmentedControl!
    
    @IBOutlet weak var itemsSharedQuestionLabel: UILabel!
    @IBOutlet weak var itemsSharedSegmentedControl: UISegmentedControl!
    
    //Shared item # label outlets
    
    @IBOutlet weak var sharedItem1: UILabel!
    @IBOutlet weak var sharedItem2: UILabel!
    @IBOutlet weak var sharedItem3: UILabel!
    @IBOutlet weak var sharedItem4: UILabel!
    @IBOutlet weak var sharedItem5: UILabel!
    @IBOutlet weak var sharedItem6: UILabel!
    @IBOutlet weak var sharedItem7: UILabel!
    @IBOutlet weak var sharedItem8: UILabel!
    
    //shared item amount Text Fields
    
    @IBOutlet weak var sharedItemAmount1: UITextField!
    @IBOutlet weak var sharedItemAmount2: UITextField!
    @IBOutlet weak var sharedItemAmount3: UITextField!
    @IBOutlet weak var sharedItemAmount4: UITextField!
    @IBOutlet weak var sharedItemAmount5: UITextField!
    @IBOutlet weak var sharedItemAmount6: UITextField!
    @IBOutlet weak var sharedItemAmount7: UITextField!
    @IBOutlet weak var sharedItemAmount8: UITextField!
    
    //shared Item People
    
    @IBOutlet weak var sharedItemPeople1: UITextField!
    @IBOutlet weak var sharedItemPeople2: UITextField!
    @IBOutlet weak var sharedItemPeople3: UITextField!
    @IBOutlet weak var sharedItemPeople4: UITextField!
    @IBOutlet weak var sharedItemPeople5: UITextField!
    @IBOutlet weak var sharedItemPeople6: UITextField!
    @IBOutlet weak var sharedItemPeople7: UITextField!
    @IBOutlet weak var sharedItemPeople8: UITextField!
    
    //Individual items
    
    
    @IBOutlet weak var individualYesorNo: UILabel!
    @IBOutlet weak var individualSegmented: UISegmentedControl!
    
    
    @IBOutlet weak var individualItemQuestion: UILabel!
    @IBOutlet weak var individualItemSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var whatsTotalLabel: UILabel!
    @IBOutlet weak var howMuchButton: UIButton!
    @IBOutlet weak var totalTaxLabel: UILabel!
    @IBOutlet weak var totalTaxResultLabel: UILabel!
    @IBOutlet weak var yourTaxDueLabel: UILabel!
    @IBOutlet weak var yourTaxDueResultLabel: UILabel!
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var totalTipResultLabel: UILabel!
    @IBOutlet weak var yourDueLabel: UILabel!
    @IBOutlet weak var yourDueResultLabel: UILabel!
    
    @IBOutlet weak var taxCostLabel: UILabel!
    @IBOutlet weak var taxCostTotal: UITextField!
    
    //Item Labels
    
    @IBOutlet weak var item1Label: UILabel!
    @IBOutlet weak var item2Label: UILabel!
    @IBOutlet weak var item3Label: UILabel!
    @IBOutlet weak var item4Label: UILabel!
    @IBOutlet weak var item5Label: UILabel!
    @IBOutlet weak var item6Label: UILabel!
    @IBOutlet weak var item7Label: UILabel!
    @IBOutlet weak var item8Label: UILabel!

    //Item Text Fields
    
    @IBOutlet weak var item1: UITextField!
    @IBOutlet weak var item2: UITextField!
    @IBOutlet weak var item3: UITextField!
    @IBOutlet weak var item4: UITextField!
    @IBOutlet weak var item5: UITextField!
    @IBOutlet weak var item6: UITextField!
    @IBOutlet weak var item7: UITextField!
    @IBOutlet weak var item8: UITextField!
    
    //Tip Label and segemented control outlets
    
    @IBOutlet weak var tipQuestion: UILabel!
    @IBOutlet weak var tipSelection: UISegmentedControl!
    
    
    //other labels and textfieds to hide
    
    @IBOutlet weak var totalBill: UITextField!
    
    var isTotalBillHidden = true
    
    @IBAction func sharingQuestionSegmentedControl(_ sender: AnyObject) {
    
        switch sharingYesorNo.selectedSegmentIndex {
            
        case 0:
            
            print(itemsSharedSegmentedControl.selectedSegmentIndex)
            print("case0")
            
            itemsSharedQuestionLabel.isHidden = false
            itemsSharedSegmentedControl.isHidden = false
            //individualItemQuestion.hidden = false
            //segmentedControl.hidden = false
            
            itemsSharedSegmentedControl.selectedSegmentIndex = -1
            
        case 1:
            
            actualSegmentedSharedIndex = -1
            itemsSharedSegmentedControl.selectedSegmentIndex = -1
            
            print(itemsSharedSegmentedControl.selectedSegmentIndex)
            print("case1")
            
            
            individualYesorNo.isHidden = false
            individualSegmented.isHidden = false
            //individualItemQuestion.hidden = false
            //segmentedControl.hidden = false
            itemsSharedQuestionLabel.isHidden = true
            itemsSharedSegmentedControl.isHidden = true
            
            sharedItemArray = [sharedItem1, sharedItem2, sharedItem3,sharedItem4,sharedItem5,sharedItem6,sharedItem7,sharedItem8]
            
            for label in sharedItemArray {
                label.isHidden = true
            }
            
            sharedItemAmount = [sharedItemAmount1,sharedItemAmount2,sharedItemAmount3,sharedItemAmount4,sharedItemAmount5,sharedItemAmount6,sharedItemAmount7,sharedItemAmount8]
            
            for text in sharedItemAmount {
                text.isHidden = true
                text.text = ""
            }
            
            sharedItemPeople = [sharedItemPeople1,sharedItemPeople2,sharedItemPeople3,sharedItemPeople4,sharedItemPeople5,sharedItemPeople6,sharedItemPeople7,sharedItemPeople8]
            
            for shared in sharedItemPeople {
                shared.isHidden = true
                shared.text = ""
            }

            
        default:
            break
            
        }
        
    }
    
    //sharing quantity selection
    
    @IBAction func sharedSelection(_ sender: AnyObject) {
        
        
        oldSegmentedSharedIndex = actualSegmentedSharedIndex
        
        actualSegmentedSharedIndex = itemsSharedSegmentedControl.selectedSegmentIndex
        
        sharedItemArray = [sharedItem1, sharedItem2, sharedItem3,sharedItem4,sharedItem5,sharedItem6,sharedItem7,sharedItem8]
        
        
        sharedItemAmount = [sharedItemAmount1,sharedItemAmount2,sharedItemAmount3,sharedItemAmount4,sharedItemAmount5,sharedItemAmount6,sharedItemAmount7,sharedItemAmount8]
        
        
        sharedItemPeople = [sharedItemPeople1,sharedItemPeople2,sharedItemPeople3,sharedItemPeople4,sharedItemPeople5,sharedItemPeople6,sharedItemPeople7,sharedItemPeople8]
        
        if actualSegmentedSharedIndex >= oldSegmentedSharedIndex {
            
            sharedItemAmount1.becomeFirstResponder()
            
            for label in sharedItemArray[0...actualSegmentedSharedIndex] {
                label.isHidden = false
            }
            for text in sharedItemAmount[0...actualSegmentedSharedIndex] {
                text.isHidden = false
            }
            for shared in sharedItemPeople[0...actualSegmentedSharedIndex] {
                shared.isHidden = false
            }
        } else {
            print(itemsSharedSegmentedControl.selectedSegmentIndex)
            for label in sharedItemArray[actualSegmentedSharedIndex+1...7] {
                label.isHidden = true
            }
            for text in sharedItemAmount[actualSegmentedSharedIndex+1...7] {
                text.isHidden = true
                text.text = ""
            }
            for shared in sharedItemPeople[actualSegmentedSharedIndex+1...7] {
                shared.isHidden = true
                shared.text = ""
            }
        }
    }
    
    @IBAction func individualOrderSegmentedControl(_ sender: AnyObject) {
        
        switch individualSegmented.selectedSegmentIndex {
            
        case 0:
            
            individualItemQuestion.isHidden = false
            individualItemSegmentedControl.isHidden = false
            
        case 1:
            
            actualSegmentedIndex = -1
            
            individualItemQuestion.isHidden = true
            individualItemSegmentedControl.isHidden = true
            
            whatsTotalLabel.isHidden = false
            totalBill.isHidden = false
            
            if passKey == false {
                totalBill.becomeFirstResponder()
            }
            
            segmentedControl.selectedSegmentIndex = -1
            
            textArray = [item1,item2,item3,item4,item5,item6,item7,item8]
            
            labelArray = [item1Label, item2Label, item3Label, item4Label, item5Label, item6Label, item7Label, item8Label]
            
            for text in textArray {
                text.isHidden = true
                text.text = ""
            }
            
            for label in labelArray {
                label.isHidden = true
            }
            
        default:
            break
        }
        
        
    }
    
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {

        print(itemsSharedSegmentedControl.selectedSegmentIndex)
        
        sharedItemAmount = [sharedItemAmount1,sharedItemAmount2,sharedItemAmount3,sharedItemAmount4,sharedItemAmount5,sharedItemAmount6,sharedItemAmount7,sharedItemAmount8]
        
        for textField in sharedItemAmount {
            if textField.text == "" {
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor.red.cgColor
            }
            
        }
        
        sharedItemPeople = [sharedItemPeople1,sharedItemPeople2,sharedItemPeople3,sharedItemPeople4,sharedItemPeople5,sharedItemPeople6,sharedItemPeople7,sharedItemPeople8]
        
        for shared in sharedItemPeople {
            if shared.text == "" {
                shared.layer.borderWidth = 1
                shared.layer.borderColor = UIColor.white.cgColor
            }
        }
        //USING A DICTIONARY
        
//        currentIndex = prevIndex
//        currentIndex = segmentedControl.selectedSegmentIndex
        print(sender.debugDescription)
        print(segmentedControl.debugDescription)
        
        oldSegmentedIndex = actualSegmentedIndex
        actualSegmentedIndex = segmentedControl.selectedSegmentIndex;
        
        tempNumber = segmentedControl.selectedSegmentIndex
        

    //Sharing segmented control
        
        
        
        
//        var toCompare = Int(tempNumLabel.text!
        
        
//
//        var labelTextDictionary : [UILabel : UITextField]! = [item1Label : item1, item2Label : item2, item3Label : item3, item4Label : item4, item5Label:item5 , item6Label:item6 , item7Label:item7, item8Label:item8]
//        
//        var labelArr = [UILabel](labelTextDictionary.keys)
//        
//        var textFieldsArr = [UITextField](labelTextDictionary.values)
//        
//        if chosenNumber > 0 {
//        
//        for label in labelArr[0...chosenNumber] {
//            label.hidden = false
//        }
//        
////        for label in labelArr[chosenNumber...9] {
////            label.hidden = true
////        }
//        
//        for text in textFieldsArr[0...chosenNumber] {
//            text.hidden = false
//        }
//        
////        for text in textFieldsArr[chosenNumber...9] {
////            text.hidden = false
////        }
////            
//        } else if chosenNumber == 0 {
//            item1Label.hidden = false
//            item1.hidden = false
//        }
        
        //REGULAR ARRAYS
        
//        for number in 1...8 {
//            var str = "item" + "\(number)"
//            textArray.append(UITextField(str))
//        }
        
        textArray = [item1,item2,item3,item4,item5,item6,item7,item8]
        
        labelArray = [item1Label, item2Label, item3Label, item4Label, item5Label, item6Label, item7Label, item8Label]
        
        print("not yet")
        print(oldSegmentedIndex)
        print(actualSegmentedIndex)
        
        
        if actualSegmentedIndex >= oldSegmentedIndex {
            
            item1.becomeFirstResponder()
            
            for text in textArray[0...actualSegmentedIndex] {
            text.isHidden = false
            }
            for label in labelArray[0...actualSegmentedIndex] {
            label.isHidden = false
        }
        } else {
            print(itemsSharedSegmentedControl.selectedSegmentIndex)
            for text in textArray[actualSegmentedIndex+1...7] {
                text.isHidden = true
                text.text = ""
            }
            for label in labelArray[actualSegmentedIndex+1...7] {
                label.isHidden = true
            }
        }

    }
    
    @IBAction func tipSelectionSegmentedControl(_ sender: AnyObject) {
        
        switch tipSelection.selectedSegmentIndex {
        case 0:
            tipPercent = 0
            howMuchButton.isHidden=false
            
        case 1:
            tipPercent = 0.15
            howMuchButton.isHidden = false
            
        case 2:
            tipPercent = 0.18
            howMuchButton.isHidden=false
            
        case 3:
            tipPercent = 0.20
            howMuchButton.isHidden = false
            
        default:
            break
        }
        
    }
    
    
    @IBAction func calculateTotal(_ sender: AnyObject) {
        
        //calculate total shared
        
        let totalShared1 = (Double(sharedItemAmount1.text!) ?? 0.0)/(Double(sharedItemPeople1.text!) ?? 1.0)
        let totalShared2 = (Double(sharedItemAmount2.text!) ?? 0.0)/(Double(sharedItemPeople2.text!) ?? 1.0)
        let totalShared3 = (Double(sharedItemAmount3.text!) ?? 0.0)/(Double(sharedItemPeople3.text!) ?? 1.0)
        let totalShared4 = (Double(sharedItemAmount4.text!) ?? 0.0)/(Double(sharedItemPeople4.text!) ?? 1.0)
        let totalShared5 = (Double(sharedItemAmount5.text!) ?? 0.0)/(Double(sharedItemPeople5.text!) ?? 1.0)
        let totalShared6 = (Double(sharedItemAmount6.text!) ?? 0.0)/(Double(sharedItemPeople6.text!) ?? 1.0)
        let totalShared7 = (Double(sharedItemAmount7.text!) ?? 0.0)/(Double(sharedItemPeople7.text!) ?? 1.0)
        let totalShared8 = (Double(sharedItemAmount8.text!) ?? 0.0)/(Double(sharedItemPeople8.text!) ?? 1.0)
        
        totalShared = totalShared1 + totalShared2 + totalShared3 + totalShared4 + totalShared5 + totalShared6 + totalShared7 + totalShared8
        
        if passKey == true {
            total = totalFromPass
        } else {
            total = Double(totalBill.text!) ?? 0.0
        }
        
        let amount1 = Double(item1.text!) ?? 0.0
        let amount2 = Double(item2.text!) ?? 0.0
        let amount3 = Double(item3.text!) ?? 0.0
        let amount4 = Double(item4.text!) ?? 0.0
        let amount5 = Double(item5.text!) ?? 0.0
        let amount6 = Double(item6.text!) ?? 0.0
        let amount7 = Double(item7.text!) ?? 0.0
        let amount8 = Double(item8.text!) ?? 0.0
        
        individual = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8
        
        sum = individual + totalShared
        
        //calculate Tax
        
        if passKey == true {
            taxTotal = taxFromPass
        } else {
            taxTotal = Double(taxCostTotal.text!) ?? 0.0
        }
        
        let taxPercent = taxTotal/total
        
        let tax = total * taxPercent
        
        let tip = total * tipPercent
        
        let percentOfTotal = sum/total
        
        taxOwed = tax * percentOfTotal
        
        tipOwed = tip * percentOfTotal
        
        grandTotalOwed = sum + taxOwed + tipOwed

        /*
        totalTaxResultLabel.text = "$ " + "\(String(format:"%.2f", tax))"
        yourTaxDueResultLabel.text = "$ " + "\(String(format: "%.2f",taxOwed))"
        totalTipResultLabel.text = "$ " + "\(String(format: "%.2f", tip))"
        yourDueResultLabel.text = "$ " + "\(String(format: "%.2f", tipOwed))"
        grandTotalLabel.text = "$ " + "\(String(format: "%.2f",grandTotalOwed))"
        */
        
        /*
        grandTotalLabel.hidden = false
        totalTaxLabel.hidden = false
        totalTaxResultLabel.hidden = false
        totalTipLabel.hidden = false
        yourDueLabel.hidden = false
        yourDueResultLabel.hidden = false
        yourTaxDueResultLabel.hidden = false
        totalTipResultLabel.hidden = false
        yourTaxDueLabel.hidden = false
        */
 
        /*
        grandTotalLabel.layer.borderWidth = 2.0
        grandTotalLabel.layer.cornerRadius = 8
        grandTotalLabel.layer.borderColor = UIColor.whiteColor().CGColor
        */
        
        //newEntryButtonOutlet.hidden = false
        
        /*
        if isPressed == false {
        UIView.animateWithDuration(3) { () -> Void in
            self.newEntryButtonOutlet.center = CGPointMake(self.newEntryButtonOutlet.center.x, self.newEntryButtonOutlet.center.y - 500)
            self.isPressed = true
            }
        }
        */
        
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        
        case sharedItemAmount1:
            sharedItemAmount1.resignFirstResponder()
            sharedItemPeople1.becomeFirstResponder()
        
        case sharedItemPeople1:
            sharedItemPeople1.resignFirstResponder()
            if itemsSharedSegmentedControl.selectedSegmentIndex > 0 {
                sharedItemAmount2.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount2:
            sharedItemAmount2.resignFirstResponder()
            sharedItemPeople2.becomeFirstResponder()
            
        case sharedItemPeople2:
            sharedItemPeople2.resignFirstResponder()
            if itemsSharedSegmentedControl.selectedSegmentIndex > 1 {
                sharedItemAmount3.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount3:
            sharedItemAmount3.resignFirstResponder()
            sharedItemPeople3.becomeFirstResponder()
            
        case sharedItemPeople3:
            sharedItemPeople3.resignFirstResponder()
            if itemsSharedSegmentedControl.selectedSegmentIndex > 2 {
                sharedItemAmount4.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount4:
            sharedItemAmount4.resignFirstResponder()
            sharedItemPeople4.becomeFirstResponder()
            
        case sharedItemPeople4:
            sharedItemPeople4.resignFirstResponder()
            if itemsSharedSegmentedControl.selectedSegmentIndex > 3 {
                sharedItemAmount5.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
        case sharedItemAmount3:
            sharedItemAmount3.resignFirstResponder()
            sharedItemPeople3.becomeFirstResponder()
            
        case sharedItemPeople3:
            sharedItemPeople3.resignFirstResponder()
            if itemsSharedSegmentedControl.selectedSegmentIndex > 2 {
                sharedItemAmount4.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount4:
            sharedItemAmount4.resignFirstResponder()
            sharedItemPeople4.becomeFirstResponder()
            
        case sharedItemPeople4:
            if itemsSharedSegmentedControl.selectedSegmentIndex > 3 {
                sharedItemAmount5.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount5:
            sharedItemAmount5.resignFirstResponder()
            sharedItemPeople5.becomeFirstResponder()
            
        case sharedItemPeople5:
            sharedItemPeople5.resignFirstResponder()
            if itemsSharedSegmentedControl.selectedSegmentIndex > 4 {
                sharedItemAmount6.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount6:
            sharedItemAmount6.resignFirstResponder()
            sharedItemPeople6.becomeFirstResponder()
            
        case sharedItemPeople6:
            sharedItemPeople6.resignFirstResponder()
            if itemsSharedSegmentedControl.selectedSegmentIndex > 5 {
                sharedItemAmount7.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount7:
            sharedItemAmount7.resignFirstResponder()
            sharedItemPeople7.becomeFirstResponder()
            
        case sharedItemPeople7:
            if itemsSharedSegmentedControl.selectedSegmentIndex > 6 {
                sharedItemAmount8.becomeFirstResponder()
            } else {
                individualYesorNo.isHidden = false
                individualSegmented.isHidden = false
            }
            
        case sharedItemAmount8:
            sharedItemAmount8.resignFirstResponder()
            sharedItemPeople8.becomeFirstResponder()
        
        case sharedItemPeople8:
            individualYesorNo.isHidden = false
            individualSegmented.isHidden = false
        
        case item1:
            item1.resignFirstResponder()
            if segmentedControl.selectedSegmentIndex > 0 {
                item2.becomeFirstResponder()
            } else if passKey == true {
                item1.resignFirstResponder()
            } else {
            totalBill.becomeFirstResponder()
            whatsTotalLabel.isHidden = false
            totalBill.isHidden = false
           }
        case item2:
            if segmentedControl.selectedSegmentIndex > 1 {
                item3.becomeFirstResponder()
            } else {
                whatsTotalLabel.isHidden = false
                totalBill.isHidden = false
                totalBill.becomeFirstResponder()
            }
        case item3:
            item3.resignFirstResponder()
            if segmentedControl.selectedSegmentIndex > 2 {
                item4.becomeFirstResponder()
            }else {
               totalBill.becomeFirstResponder()
                whatsTotalLabel.isHidden = false
                totalBill.isHidden = false
            }
        case item4:
            item4.resignFirstResponder()
            if segmentedControl.selectedSegmentIndex > 3 {
                item5.becomeFirstResponder()
            } else {
                totalBill.becomeFirstResponder()
                whatsTotalLabel.isHidden = false
                totalBill.isHidden = false
            }
        case item5:
            item5.resignFirstResponder()
            if segmentedControl.selectedSegmentIndex > 4 {
                item6.becomeFirstResponder()
            } else {
                totalBill.becomeFirstResponder()
                whatsTotalLabel.isHidden = false
                totalBill.isHidden = false
            }
        case item6:
            item6.resignFirstResponder()
            if segmentedControl.selectedSegmentIndex > 5 {
                item6.becomeFirstResponder()
            } else {
                totalBill.becomeFirstResponder()
                whatsTotalLabel.isHidden = false
                totalBill.isHidden = false
            }
        case item7:
            item7.resignFirstResponder()
            if segmentedControl.selectedSegmentIndex > 6 {
                item8.becomeFirstResponder()
            } else {
                totalBill.becomeFirstResponder()
                whatsTotalLabel.isHidden = false
                totalBill.isHidden = false
            }
        case item8:
            item8.resignFirstResponder()
            totalBill.becomeFirstResponder()
            whatsTotalLabel.isHidden = false
            totalBill.isHidden = false
            
        case totalBill:
            
            let total = Double(totalBill.text!) ?? 0.0
            
            if total != 0.0 {
                
            print(totalBill)
            totalBill.resignFirstResponder()
            taxCostLabel.isHidden = false
            taxCostTotal.isHidden = false
            taxCostTotal.becomeFirstResponder()
                
            } else {
                
                let alert = UIAlertController(title: "Missing Information", message: "Please enter the bill total wihout tax", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                totalBill.becomeFirstResponder()
            }
            
        case taxCostTotal :
            
            let taxCost = Double(taxCostTotal.text!) ?? 0.0
            
            if taxCost != 0.0 {
                taxCostTotal.resignFirstResponder()
                tipQuestion.isHidden = false
                tipSelection.isHidden = false
                
            } else {
                    
                    let alert = UIAlertController(title: "Missing Information", message: "Please enter the tax", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    totalBill.becomeFirstResponder()
                }
                
        default :
            break
        }

    }
    
    func endEditingNow() {
        
                self.view.endEditing(true)

    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        //create toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.isTranslucent = true
        
        if taxKey == true {
            if textField == taxCostTotal {
                taxCostTotal.text = ""
                taxKey = false
            }
        }
        if totalBillKey == true {
            if textField == totalBill {
                totalBill.text = ""
                totalBillKey = false
            }
        }
        
        
        if textField == taxCostTotal  {
            let item = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.endEditingNow))
            let toolbarButtons = [item]
            toolbar.setItems(toolbarButtons, animated: true)
            textField.inputAccessoryView = toolbar
            
        } else {
            
        let item = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.endEditingNow))
            let toolbarButtons = [item]
            toolbar.setItems(toolbarButtons, animated: true)
            textField.inputAccessoryView = toolbar
        }
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print("view did loading")
        //totalShared = totalSharedSum
        
        if isTotalBillHidden == false {
            // if this thing is to be hidden then hide
            self.totalBill.isHidden = true
        }
        
        
        individualYesorNo.isHidden = true
        individualSegmented.isHidden = true
        individualSegmented.selectedSegmentIndex = -1
        
        itemsSharedSegmentedControl.selectedSegmentIndex = -1
        
        tipQuestion.isHidden = true
        tipSelection.isHidden = true
        
        //segueLabel.text = String(totalShared!)
        
        print(totalShared)
        
        sharingYesorNo.selectedSegmentIndex = -1
        
        individualItemSegmentedControl.isHidden = true
        individualItemQuestion.isHidden = true
        
        segmentedControl.selectedSegmentIndex = -1
        
        itemsSharedQuestionLabel.isHidden = true
        itemsSharedSegmentedControl.isHidden = true
        
        sharedItemArray = [sharedItem1, sharedItem2, sharedItem3,sharedItem4,sharedItem5,sharedItem6,sharedItem7,sharedItem8]
        
        for label in sharedItemArray {
            label.isHidden = true
        }
        
        sharedItemAmount = [sharedItemAmount1,sharedItemAmount2,sharedItemAmount3,sharedItemAmount4,sharedItemAmount5,sharedItemAmount6,sharedItemAmount7,sharedItemAmount8]
        
        for textField in sharedItemAmount {
            textField.isHidden = true
            textField.delegate = self
        }
        
        sharedItemPeople = [sharedItemPeople1,sharedItemPeople2,sharedItemPeople3,sharedItemPeople4,sharedItemPeople5,sharedItemPeople6,sharedItemPeople7,sharedItemPeople8]
        
        for shared in sharedItemPeople {
            shared.isHidden = true
            shared.delegate = self
        }
        
        item1.isHidden = true
        item2.isHidden = true
        item3.isHidden = true
        item4.isHidden = true
        item5.isHidden = true
        item6.isHidden = true
        item7.isHidden = true
        item8.isHidden = true

        item1Label.isHidden = true
        item2Label.isHidden = true
        item3Label.isHidden = true
        item4Label.isHidden = true
        item5Label.isHidden = true
        item6Label.isHidden = true
        item7Label.isHidden = true
        item8Label.isHidden = true

        whatsTotalLabel.isHidden = true
        totalBill.isHidden = true
        howMuchButton.isHidden = true
        //totalTaxLabel.hidden = true
        //totalTipLabel.hidden = true
        //yourDueLabel.hidden = true
        //yourDueResultLabel.hidden = true
        //yourTaxDueResultLabel.hidden = true
        //totalTipLabel.hidden = true
        //totalTipResultLabel.hidden = true
        //totalTaxResultLabel.hidden = true
        //yourTaxDueLabel.hidden = true
        //grandTotalLabel.hidden = true
        
        taxCostLabel.isHidden = true
        taxCostTotal.isHidden = true
        
        sharedItemAmount1.delegate = self
        sharedItemPeople1.delegate = self
        
        taxCostTotal.delegate = self
        
        item1.delegate = self
        item2.delegate = self
        item3.delegate = self
        item4.delegate = self
        item5.delegate = self
        item6.delegate = self
        item7.delegate = self
        item8.delegate = self
        
        totalBill.delegate = self
        
        //newEntryButtonOutlet.hidden = true
        
       //newEntryButtonOutlet.center = CGPointMake(newEntryButtonOutlet.center.x, newEntryButtonOutlet.center.y + 500)
    }

    /*
    @IBAction func newEntryButton(sender: AnyObject) {
        
        textArray = [item1,item2,item3,item4,item5,item6,item7,item8]
        for text in textArray {
            text.text = ""
            text.hidden = true
        }
        
        labelArray = [item1Label, item2Label, item3Label, item4Label, item5Label, item6Label, item7Label, item8Label]
        for label in labelArray {
            label.hidden = true
        }
        
        totalBill.text = ""
        whatsTotalLabel.hidden = true
        totalBill.hidden = true
        howMuchButton.hidden = true
        totalTaxLabel.hidden = true
        totalTipLabel.hidden = true
        yourDueLabel.hidden = true
        yourDueResultLabel.hidden = true
        yourTaxDueResultLabel.hidden = true
        totalTipLabel.hidden = true
        totalTipResultLabel.hidden = true
        totalTaxResultLabel.hidden = true
        yourTaxDueLabel.hidden = true
        grandTotalLabel.hidden = true
        
        newEntryButtonOutlet.hidden = true
        
        segmentedControl.selectedSegmentIndex = -1
        
        isPressed = false
    }
    */
   
    /*
    override func viewWillAppear(animated: Bool) {
        item1.hidden = true
        
    }
 */
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appearing")
        
        if passKey == true {
            
            whatsTotalLabel.isHidden = false
            totalBill.isHidden = false
            taxCostLabel.isHidden = false
            taxCostTotal.isHidden = false
            tipQuestion.isHidden = false
            tipSelection.isHidden = false
            howMuchButton.isHidden = false
            
            totalBill.text = "$ " + "\(String(format:"%.2f", totalFromPass))"
            taxCostTotal.text = "$ " + "\(String(format:"%.2f", taxFromPass))"
            
        }
        
       /* if isTotalBillHidden == false {
            // if this thing is to be hidden then hide
            self.totalBill.hidden = true
        }

        */
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let displayScene = segue.destination as! DisplayViewController
    
        displayScene.shared = totalShared
        displayScene.individual = individual
        displayScene.tax = taxOwed
        displayScene.tip = tipOwed
        displayScene.grandTotal = grandTotalOwed
        displayScene.totalBillCharged = Double(totalBill.text!) ?? 0.0
        displayScene.taxCharged = Double(taxCostTotal.text!) ?? 0.0
        
        if totalBillKey == true {
            displayScene.totalBillCharged = totalFromPass
        }
        if taxKey == true {
            displayScene.taxCharged = taxFromPass
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


