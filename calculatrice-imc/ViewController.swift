//
//  ViewController.swift
//  calculatrice-imc
//
//  Created by christophe milliere on 04/11/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var valueSize:Int?
    var valueKilo:Int?

    @IBOutlet weak var textFieldSize: UITextField!
    @IBOutlet weak var textFieldKilo: UITextField!
    @IBOutlet weak var labelResponseImc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func calculator(_ sender: UIButton) {
        calvulatorImc()
    }
    
    @IBAction func incrementSizeAction(_ sender: UIStepper) {
        valueSize = Int(sender.value)
        textFieldSize.text! = "\(valueSize!)"
    }
    
    @IBAction func incrementKiloAction(_ sender: UIStepper) {
        valueKilo = Int(sender.value)
        textFieldKilo.text! = "\(valueKilo!)"
    }
    
    func calvulatorImc(){
        let taille2 = Double(valueSize!) / 100 * Double(valueSize!) / 100
        let imc = Double(valueKilo!) / taille2
        labelResponseImc.text! = "\(interpreterIMC(imc: imc))"
    }
    
    func interpreterIMC(imc:Double) -> String {
        var text = " avec un IMC de \(imc)"

        switch imc {
        case 0...16:
            text = "Dénutrition \(text)"
        case 16.5...18.5:
            text = "État de maigreur\(text)"
        case 18.5...25:
            text = "Corpulence normale\(text)"
        case 25...30:
            text = "Surpoids\(text)"
        case 30...35:
            text = "Obésité modéré\(text)"
        case 35...40:
            text = "Obèsité sévère\(text)"
        case 40...50:
            text = "Obèsité morbide\(text)"
        default:
            print("")
        }
        return text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

