//
//  ViewController.swift
//  Calculator
//
//  Created by Dmitry Kriayhkov on 16.05.19.
//  Copyright © 2019 Dmitry Kriayhkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Double = 0;
    var firstNum:Double = 0;
    var operations:Int = 0;

    var mathSign:Bool = false;

    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    func mathOperation() {
        switch operations {
        case 11:
            result.text = String((firstNum * numberFromScreen)/100)
        case 12:
            result.text = String(firstNum / numberFromScreen)
        case 13:
            result.text = String(firstNum * numberFromScreen)
        case 14:
            result.text = String(firstNum - numberFromScreen)
        case 15:
            result.text = String(firstNum + numberFromScreen)
        default:
            result.text = "ERROR!"
        }
    }
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 16 {
            firstNum = Double(result.text!)!
        switch sender.tag {
            case 10:
                result.text = "";
                firstNum = 0;
                operations = 0;
                numberFromScreen = 0;
            case 11:
                result.text = "%";
            case 12:
                result.text = "/";
            case 13:
                result.text = "*";
            case 14:
                result.text = "-";
            case 15:
                result.text = "+";
            case 16:
                mathOperation();
            case 17:
                result.text = ".";
            default:
                result.text = "ERROR!"
            }
            operations = sender.tag
            mathSign = true;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

