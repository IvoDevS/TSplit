//
//  SharedItemsViewController.swift
//  
//
//  Created by Ivo Radoslavov on 1/28/17.
//
//

import UIKit

class SharedItemsViewController: UIViewController {

    
//Outlets
    
    @IBOutlet weak var sharedItemsSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var itemsQuestion: UILabel!
    
//Action
    
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
    
    @IBOutlet weak var numberOfItemsShared: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sharedItemsSegmentedControl.selectedSegmentIndex = -1
        
        itemsQuestion.hidden = true
        
        numberOfItemsShared.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
