//
//  BMIBrain.swift
//  bmi-calculator
//
//  Created by Aman Giri on 2024-03-24.
//

import UIKit

struct BMIBrain{
    var selectedHeight: Int
    var selectedWeight: Int
    
    var bmiData = BMI()
    
    init(_ selectedHeight: Int, _ selectedWeight: Int) {
        self.selectedHeight = selectedHeight
        self.selectedWeight = selectedWeight
    }
    
    mutating func updateHeight(_ newHeight: Int){
        selectedHeight = newHeight
    }
    
    mutating func updateWeight(_ newWeight: Int){
        selectedWeight = newWeight
    }
    
    mutating func calculateBMI() -> BMI {
        let finalBMI: Float = (Float(selectedWeight)/Float(selectedHeight)/Float(selectedHeight)) * 10000
        let formatedBMI = String(format: "%.2f", finalBMI)
        bmiData.bmiValue = formatedBMI
        
        if finalBMI <= 20.00 {
            bmiData.suggestion = "Eat more Pizza"
            bmiData.color = UIColor.blue
        } else if (finalBMI <= 40){
            bmiData.suggestion = "You are good"
            bmiData.color = UIColor.green
        } else {
            bmiData.suggestion = "Eat less Pizza"
            bmiData.color = UIColor.red
        }
        
        return bmiData
    }
}
