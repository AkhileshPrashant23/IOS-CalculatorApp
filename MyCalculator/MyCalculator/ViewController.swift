//
//  ViewController.swift
//  MyCalculator
//
//  Created by Student on 24/01/23.
//  Copyright © 2023 ACE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calOperation: UILabel!
    @IBOutlet weak var calAnswer: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        calOperation.text = ""
        calAnswer.text = ""
    }
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    //Action Buttons
    @IBAction func allClearButton(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backButton(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calOperation.text = workings
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calOperation.text = workings
    }
    
    @IBAction func percentButton(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func dvideButton(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func productButton(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func plusButton(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func equalButton(_ sender: Any) {
        
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calAnswer.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func decimalButton(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func tenbutton(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
}

