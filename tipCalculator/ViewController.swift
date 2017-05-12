//
//  ViewController.swift
//  tipCalculator
//
//  Created by Samuel Moon on 5/11/17.
//  Copyright © 2017 Samuel Moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var baseTipLabel: UILabel!
    @IBOutlet weak var tipPlusFiveLabel: UILabel!
    @IBOutlet weak var tipPlusTenLabel: UILabel!
    @IBOutlet weak var splitTotalBase: UILabel!
    @IBOutlet weak var splitTotalPlusFive: UILabel!
    @IBOutlet weak var splitTotalPlusTen: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipAmountPlusFiveLabel: UILabel!
    @IBOutlet weak var tipAmountPlusTenLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!

    
    var totalString = ""
    var groupSize = 1
    var tipSliderValue = 0
    var tipSliderCalc: Double = 1
    
    func updateUI() {
        if let totalCost = Double(totalString){
            let newCost = Double(totalCost) * Double(tipSliderCalc)
            tipAmountLabel.text = String(format: "%.2f", Double(totalCost) * Double(tipSliderCalc - 1))
            tipAmountPlusFiveLabel.text = String(format: "%.2f", Double(totalCost) * Double((tipSliderCalc + 0.05) - 1))
            tipAmountPlusTenLabel.text = String(format: "%.2f", Double(totalCost) * Double((tipSliderCalc + 0.10) - 1))
            
            let totalSplit = Double(newCost) / Double(groupSize)
            print(totalSplit)
            
            
            splitTotalBase.text = String(format: "%.2f",totalSplit)
            splitTotalPlusFive.text = String(format: "%.2f", Double(totalSplit) * Double(tipSliderCalc + 0.05))
            splitTotalPlusTen.text = String(format: "%.2f", Double(totalSplit) * Double(tipSliderCalc + 0.10))
        }
    }
    
    @IBAction func tipSlider(_ sender: UISlider) {
        print(sender.value)
        print(Int(sender.value))
        tipSliderValue = Int(sender.value)
        tipSliderCalc = (Double(sender.value) / Double(100)) + Double(1)
        print(tipSliderCalc, "tip SLider")
        let tipPlusFive = tipSliderValue + 5
        let tipPlusTen = tipSliderValue + 10
        print(tipSliderValue)
        baseTipLabel.text = String(tipSliderValue) + "%"
        tipPlusFiveLabel.text = String(tipPlusFive) + "%"
        tipPlusTenLabel.text = String(tipPlusTen) + "%"
        updateUI()
    }
    
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        groupSize = Int(sender.value)
        groupSizeLabel.text = "Group Size: " + String(groupSize)
        updateUI()
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if sender.tag != 10 {
            totalString += String(sender.tag)
            updateUI()
            totalLabel.text = totalString
        }
        else if sender.tag == 10{
            totalString += "."
            totalLabel.text = totalString
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        totalString = ""
        totalLabel.text = String(0)
        splitTotalBase.text = String(0)
        splitTotalPlusFive.text = String(0)
        splitTotalPlusTen.text = String(0)
        tipAmountLabel.text = String(0)
        tipAmountPlusFiveLabel.text = String(0)
        tipAmountPlusTenLabel.text = String(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        groupSizeLabel.text = "Group Size: " + String(groupSize)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

