//
//  ViewController.swift
//  BullsEye
//
//  Created by Alessandro Malinverni on 15/10/2016.
//  Copyright © 2016 badwinters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        // IB: inteface builder action, it is the show_alert controller.
        
        let alert = UIAlertController(title: "Helloworld", message: "This is my first app", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
        print("The value of the slider is now: \(slider.value)")
    }


}

