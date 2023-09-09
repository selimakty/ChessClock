//
//  TimerController.swift
//  ChessClock
//
//  Created by Selim on 8.09.2023.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var minute = 0
    var plus = 0
    
    var timer1 = Timer()
    var timer2 = Timer()
    
    var counter1Minute = 0
    var counter1Second = 60
    
    var counter2Minute = 0
    var counter2Second = 60
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter1Minute = minute-1
        counter2Minute = minute-1
        
        firstLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        firstLabel.text = String(minute)+":00"
        secondLabel.text = String(minute)+":00"
        
        firstView.isUserInteractionEnabled = false
        secondView.isUserInteractionEnabled = false
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(tapFirstView))
        firstView.addGestureRecognizer(gesture1)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(tapSecondView))
        secondView.addGestureRecognizer(gesture2)
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        secondView.isUserInteractionEnabled = true
        timer2.invalidate()
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func menuButton(_ sender: Any) {
    }
    
    @objc func firstTimer(){
       
        
        if counter1Second == 0 {
            counter1Second = 60
            
            if counter1Minute == 0 {
                timer1.invalidate()
            }
            else {
                counter1Minute -= 1
            }
        }
        
        counter1Second -= 1
        firstLabel.text = String(counter1Minute) + ":" + String(counter1Second)
    }
    
    @objc func secondTimer(){
        
        
        if counter2Second == 0 {
            counter2Second = 60
            
            if counter2Minute == 0 {
                timer1.invalidate()
            }
            else {
                counter2Minute -= 1
            }
        }
        
        counter2Second -= 1
        secondLabel.text = String(counter2Minute) + ":" + String(counter2Second)
    }
    
    @objc func tapFirstView() {
        secondView.isUserInteractionEnabled = true
        firstView.isUserInteractionEnabled = false
        
        counter1Second += plus
        
        if counter1Second >= 60 {
            counter1Minute += 1
            counter1Second -= 60
        }
        
        firstLabel.text = "\(counter1Minute):\(counter1Second)"
        
        timer1.invalidate()
        
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondTimer), userInfo: nil, repeats: true)
       
    }
    
    @objc func tapSecondView() {
        firstView.isUserInteractionEnabled = true
        secondView.isUserInteractionEnabled = false
        
        counter2Second += plus
        
        if counter2Second >= 60 {
            counter2Minute += 1
            counter2Second -= 60
        }
        
        secondLabel.text = "\(counter2Minute):\(counter2Second)"
        
        timer2.invalidate()
        
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(firstTimer), userInfo: nil, repeats: true)
    }
}
