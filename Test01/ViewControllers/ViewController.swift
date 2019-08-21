//
//  ViewController.swift
//  Test01
//
//  Created by Abraham Escamilla Pinelo on 8/20/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextField()
    }
    
    func setupTextField() {
        self.myTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Update label here after the user press return
        let zipCode = textField.text
        API.manager.getWeatherInfo(byZipCode: zipCode) { (info, err) in
            guard let err = err else {
                //All god here, No errors :)
                self.myLabel.text = info
                return
            }
            //Error here
            let myError = err as! MyWeatherErros
            self.myLabel.text = myError.description
        }
        
        textField.resignFirstResponder()
        return true
    }
}

