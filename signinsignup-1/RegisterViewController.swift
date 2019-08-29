//
//  RegisterViewController.swift
//  signinsignup-1
//
//  Created by Kerim Çağlar on 29.08.2019.
//  Copyright © 2019 Kerim Çağlar. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var passFieldAgain: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func register(_ sender: Any) {
        
        guard let name = nameField.text else { return }
        guard let lastName = lastNameField.text else { return }
        guard let email = emailField.text else { return }
        guard let password = passField.text else { return }
        guard let passAgain = passFieldAgain.text else { return }
        
        let params = "name=" + name + "&lastName=" + lastName + "&email=" + email + "&password=" + password
        
        print(name, lastName, email, password, passAgain)
        print(params)
    }
    

}
