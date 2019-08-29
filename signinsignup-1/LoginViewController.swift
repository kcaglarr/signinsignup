//
//  ViewController.swift
//  signinsignup-1
//
//  Created by Kerim Çağlar on 29.08.2019.
//  Copyright © 2019 Kerim Çağlar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        print(email, password)
    }
    
}

