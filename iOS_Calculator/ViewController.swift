//
//  ViewController.swift
//  iOS_Calculator
//
//  Created by Consultant on 12/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [cButton, plusMinusButton, percentageButton, divisionButton, sevenButton, eightButton, nineButton, multiplicationButton, fourButton, fiveButton, sixButton, minusButton, oneButton, twoButton, threeButton, plusButton, zeroButton, decimalButton, equalButton]
        
        for button in buttons {
            button!.layer.borderWidth = 0.5
            button!.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    
    @IBAction func number(_ sender: Any) {
        
        if performingMath {
            outputLabel.text = String((sender as AnyObject).tag - 1)
            numberOnScreen = Double(outputLabel.text!)!
            performingMath = false
        } else {
            if outputLabel.text == "0" {
                outputLabel.text = String((sender as AnyObject).tag - 1)
                numberOnScreen = Double(outputLabel.text!)!
            } else {
                outputLabel.text = outputLabel.text! + String((sender as AnyObject).tag - 1)
                numberOnScreen = Double(outputLabel.text!)!
            }
            
        }
        
    }
    
    @IBAction func buttons(_ sender: Any) {
        
        if outputLabel.text != "0" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16{

            previousNumber = Double(outputLabel.text!)!

            if (sender as AnyObject).tag == 12 { //Divide

                outputLabel.text = "/"

            }

            if (sender as AnyObject).tag == 13 { //Multiply

                outputLabel.text = "X"

            }

            if (sender as AnyObject).tag == 14 { //Subtract

                outputLabel.text = "-"

            }

            if (sender as AnyObject).tag == 15 { //Add

                outputLabel.text = "+"

            }

            operation = (sender as AnyObject).tag
            
            print("Sender: \((sender as AnyObject).tag!)")
            
            performingMath = true

        }

        else if (sender as AnyObject).tag == 16 {

            if operation == 12{ //Divide

                outputLabel.text = String(previousNumber / numberOnScreen)

            }

            else if operation == 13{ //Multiply

                outputLabel.text = String(previousNumber * numberOnScreen)

            }

            else if operation == 14{ //Subtract

                outputLabel.text = String(previousNumber - numberOnScreen)

            }

            else if operation == 15{ //Add

                outputLabel.text = String(previousNumber + numberOnScreen)

            }

        }

        else if (sender as AnyObject).tag == 11{

            outputLabel.text = "0"

            previousNumber = 0

            numberOnScreen = 0

            operation = 0

        }

        
        
    }
    
    
}

