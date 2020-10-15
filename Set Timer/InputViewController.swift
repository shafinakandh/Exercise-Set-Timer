//
//  InputViewController.swift
//  Set Timer
//
//  Created by Shafin Akandh on 10/6/20.
//


import UIKit

var setNumberText: Int?
var setLengthText: Int?
var restLengthText: Int?

class InputViewController: UIViewController
{
    //var InputViewController : SetTimerViewController = SetTimerViewController(nib)
    
    @IBOutlet weak var setNumberField: UITextField!
    @IBOutlet weak var setLengthField: UITextField!
    @IBOutlet weak var restLengthField: UITextField!
    @IBAction func startButton(_ sender: Any) {
        
        setNumberText = Int(setNumberField.text!)
        setLengthText = Int(setLengthField.text!)
        restLengthText = Int(restLengthField.text!)
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setNumberField.delegate = self
//        setLengthField.delegate = self
//        restLengthField.delegate = self
    }
    
    
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
    
}

//extension InputViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
