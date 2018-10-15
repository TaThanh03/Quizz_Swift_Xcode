//
//  ViewController.swift
//  Quizz_Swift
//
//  Created by TA Trung Thanh on 13/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit
typealias Q_a_A = (Bool, String, String, Bool)

class QuestionAndAnswer: NSObject {
    //create a set of tuple
    private var Q_and_A = [(false, "Who is the father of the atomic bomb?", "Robert Oppenheimer", false),
                   (false, "What is the meaning of life?", "The meaning of life is 42.", false),
                   (false, "Who was the first man to fly around the earth with a spaceship?", "Gagarin", false),
                   (true, "On which hemisphere were the most dinosaur skeletons found?", "The northern hemisphere", false),
                   (true, "What color is cobalt?", "Blue", false),
                   (true, "What is the organ that is affected when one is suffering from hepatitis?", "Liver", false),
                   (false, "Which device do we use to look at the stars?", "Telescope", false),
                   (true, "Which unit indicates the light intensity?", "Candela", false),
                   (false, "What are the three primary colors?", "Blue, yellow and red", false),
                   (false, "Which planet is nearest the sun?", "Mercury", false),
                   (true, "Who discoved one of the first antibiotics: penicillin ?", "Alexander Fleming", false),
                   (false, "What is the substance known by the chemical formula NH3?", "Ammoniac", false),
                   (false, "What is the lightest existing metal?", "Aluminium", false),
                   (false, "Who was the inventor of the steam engine?", "James Watt", false),
                   (true, "Two brothers invented the hot air balloon. What was their surname?", "Montgolfier", false),
                   (true, "What are the three primary colors?", "Blue, yellow and red", false),
                   (false, "Who was the first American in space?", "Alan Shepard", false)]
    
    func getSize () -> Int{
        return Q_and_A.count
    }
    
    func getQandA (target : Int) -> Q_a_A{
        return Q_and_A[target]
    }
    
    func setQandA (target : Int , val : Bool) -> Void{
        Q_and_A[target].3 = val
    }
    
}


class ViewController: UIViewController {
    var myQandA = QuestionAndAnswer()
    var cpt : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQandA()
    }
    @IBOutlet weak var outletQuestion: UITextView!
    @IBOutlet weak var outletSwitch: UISwitch!
    @IBOutlet weak var outletAnswer: UITextView!
    
    func displayQandA() {
        if (myQandA.getQandA(target: cpt).0){ //hard question
            outletQuestion.textColor = UIColor.red
        } else {
            outletQuestion.textColor = UIColor.black
        }
        outletQuestion.text = myQandA.getQandA(target: cpt).1
        if (myQandA.getQandA(target: cpt).3){ //already use help
            outletAnswer.text = myQandA.getQandA(target: cpt).2
        } else {
            outletAnswer.text = ""
        }
    }
    
    @IBAction func actionNext(_ sender: Any) {
        if (cpt < myQandA.getSize() - 1){
            cpt += 1
            if (outletSwitch.isOn){ //display hard question
                displayQandA()
            } else { //skip hard question, jump to the next easy quetion
                while (myQandA.getQandA(target: cpt).0 && cpt < myQandA.getSize() - 1){ 
                    cpt += 1
                }
                displayQandA()
            }
        }
    }
    
    @IBAction func actionPrevious(_ sender: Any) {
        if (cpt > 0){
            cpt -= 1
            if (outletSwitch.isOn){
                displayQandA()
            } else { //jump to the next easy quetion
                while (myQandA.getQandA(target: cpt).0 && cpt > 0){
                    cpt -= 1
                }
                displayQandA()
            }
        }
    
    }
    
    @IBAction func actionGetAnswer(_ sender: Any) {
        myQandA.setQandA(target: cpt, val: true)
        displayQandA()
    }
}

