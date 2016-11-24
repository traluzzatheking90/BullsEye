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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    // the current value of the slider
    var currentValue: Int = 0  // i can declare variable without type
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0

    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib. Good place to instance variables
        // Before loading Storyboard
        super.viewDidLoad()
        
        self.startNewGame()
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
        
        var points = 100 - difference
        
        let title: String
        
        if difference == 0 {
            
            title = "Perfect!"
            points += 100
            
        } else if difference < 2 {
            
            title = "You almost had it!"
            points += 25
            
        } else if difference < 10 {
            
            title = "Pretty good!"
            
        } else {
            
            title = "Not even close..."
            points -= 20
            
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: { action in
                                                    self.startNewRound()
                                                    self.updateLabels()}) // When the allert will be dismissed start this closure
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOver(){
        self.startNewGame()
        self.updateLabels()

    }
    
    
    @IBAction func sliderMoved(_ slider:UISlider){
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewGame(){
        score = 0
        round = 0
        self.startNewRound()
    }
    
    func startNewRound(){
        // this function generate a random number between 0 and 99
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        round += 1
        slider.value = Float(currentValue)
    
    }
    
    func updateLabels(){
        roundLabel.text = String(round)
        targetLabel.text = String(targetValue) //targetLabel.text = "\(targetValue)" the same
        scoreLabel.text = String(score)
    }

}
