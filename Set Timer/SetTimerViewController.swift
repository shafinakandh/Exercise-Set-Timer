//
//  SetTimerViewController.swift
//  Set Timer
//
//  Created by Shafin Akandh on 10/4/20.
//

import UIKit

class SetTimerViewController: InputViewController
{
    //@IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerTypeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var isTimerRunning = false
    
    var currentSet = 2
    var currentRest = 1
    var counter = 0.0
    var timerCycle = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        counter = Double(setLengthText!)
        timerCycle = (setNumberText! * 2) - 1
    }

    @IBAction func pauseDidTap(_ sender: Any)
    {
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        isTimerRunning = false
        timer.invalidate()
    }
    
    @IBAction func startDidTap(_ sender: Any)
    {
        
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
    
    // MARK: - Helper Methods
    
    
    @objc func runTimer()
    {
        counter -= 0.1
        // HH:MM:SS:_
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"}
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"}
        
        let decisecond = String(format: "%.1f", counter).components(separatedBy: "." ).last!
        
        timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"

        if counter <= 0.0 {
            
            timerLabel.text = "00:00:00.0"
            
            if timerCycle % 2 == 0
            {
                timerTypeLabel.text = "Set #\(currentSet)"
                counter = Double(setLengthText!)
                currentSet += 1

            }
            
            else if timerCycle % 2 == 1
            {
                timerTypeLabel.text = "Rest #\(currentRest)"
                counter = Double(restLengthText!)
                currentRest += 1
            }
            
            timerCycle -= 1
            if timerCycle <= 0 {
                timerTypeLabel.text = "All done!"
                counter = 0.0
                timerLabel.text = "00:00:00.0"
            }
        }
    }
}
