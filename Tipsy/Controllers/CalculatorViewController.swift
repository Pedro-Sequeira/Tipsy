//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 0
    var billTotal = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        dismissKeyboard()
        clearAllButtons()
        sender.isSelected = true
        if sender == zeroPctButton {
            tip = 0
        } else if sender == tenPctButton {
            tip = 0.1
        } else if sender == twentyPctButton {
            tip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        dismissKeyboard()
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculateTotal()
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    func clearAllButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    func dismissKeyboard() {
        billTextField.endEditing(true)
    }
    
    func calculateTotal() {
        if !billTextField.text!.isEmpty {
            billTotal = Double(billTextField.text!)!
        }
        
        billTotal += billTotal * tip
        
        billTotal /= Double(numberOfPeople)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ResultsViewController
        let bill = Bill(billTotal, tip, numberOfPeople)
        destination.bill = bill
    }
}
