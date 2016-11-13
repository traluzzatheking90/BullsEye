//
//  ViewController.swift
//  BullsEye
//
//  Created by Alessandro Malinverni on 15/10/2016.
//  Copyright © 2016 badwinters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    // the current value of the slider
    var currentValue: Int = 0
    var targetValue: Int = 0

    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib. Good place to instance variables
        // Before loading Storyboard
        super.viewDidLoad()
        
        self.startNewRound()
        self.updateLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        // IB: inteface builder action, it is the show_alert controller.
        // let and not var for difference and message because are costants
        let difference = abs ( currentValue - targetValue)
        
        let points = 100 - difference
        
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: "Slider Value",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        self.startNewRound()
        self.updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        // this function generate a random number between 0 and 99
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue) //targetLabel.text = "\(targetValue)" the same
    }

}
