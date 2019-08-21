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
    @IBOutlet weak var topTextFieldConstraint: NSLayoutConstraint!
    
    var myCustomView: UIView!
    
    var viewModel = MyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextField()
        self.setupCustomView()
    }
    
    func setupCustomView() {
        self.myCustomView = UIView()
        self.myCustomView.backgroundColor = .red
        self.myCustomView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.myCustomView)
        
        self.myCustomView.topAnchor.constraint(equalTo: self.myLabel.bottomAnchor, constant: 10).isActive = true
        //self.myCustomView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        self.myCustomView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.myCustomView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.myCustomView.heightAnchor.constraint(equalToConstant: 250).isActive = true
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

