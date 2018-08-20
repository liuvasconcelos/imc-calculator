//
//  ViewController.swift
//  IMC
//
//  Created by Stant 02 on 10/08/18.
//  Copyright © 2018 Liu Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultView: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculeButton(_ sender: Any) {
        if let weightValue = Double(weight.text!), let heightValue = Double(height.text!) {
            let height = heightValue/100
            imc = weightValue / (height * height)
            showResults()
        }
    }
    
    private func showResults() {
        var resultToShow: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                resultToShow = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                resultToShow = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                resultToShow = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                resultToShow = "Sobrepeso"
                image = "sobre"
            default:
                resultToShow = "Obesidade"
                image = "obesidade"
        }
        
        result.text = "\(Int(imc))%: \(resultToShow)"
        resultImage.image = UIImage(named: image)
        resultView.isHidden = false
        view.endEditing(true)
    }
}

