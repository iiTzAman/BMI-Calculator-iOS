//
//  ResultsViewController.swift
//  bmi-calculator
//
//  Created by Aman Giri on 2024-03-24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var labelBMI: UILabel!
    @IBOutlet weak var labelSuggestion: UILabel!
    
    var bmiValue: String?
    var suggestion: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Welcome to my App")
        view.backgroundColor = color ?? UIColor.white
        labelBMI.text = bmiValue ?? "0.00"
        labelSuggestion.text = suggestion ?? "No Suggestion"
    }

    @IBAction func btnRecalculateTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
