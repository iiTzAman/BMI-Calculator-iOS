//
//  ViewController.swift
//  bmi-calculator
//
//  Created by Aman Giri on 2024-03-24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiCalculator = BMIBrain(150, 75)
    var bmiData: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateHeightLabel()
        updateWeightLabel()
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        bmiCalculator.updateHeight(Int(sender.value))
        updateHeightLabel()
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        bmiCalculator.updateWeight(Int(sender.value))
        updateWeightLabel()
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        bmiData = bmiCalculator.calculateBMI()
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    func updateHeightLabel(){
        heightLabel.text = String(bmiCalculator.selectedHeight)
    }
    
    func updateWeightLabel(){
        weightLabel.text = String(bmiCalculator.selectedWeight)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = bmiData?.bmiValue
            destinationVC.color = bmiData?.color
            destinationVC.suggestion = bmiData?.suggestion
        }
    }
    
}

