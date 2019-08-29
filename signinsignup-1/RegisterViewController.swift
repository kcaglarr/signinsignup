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
        
        //print(name, lastName, email, password, passAgain)
        //print(params)
        
        if password != passAgain {
            print("Şifre tekrarları uymuyor!")
        }
        
        let urlString = "http://localhost:8888/signinsignup/register.php"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: .utf8)
        
        debugPrint("------> request:",request)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print("ERROR:", error!)
            }
            
            else{
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    //debugPrint("**********json:", json!)
                    
                    if let jsonParse = json {
                        var message:String!
                        var status:String!
                        
                        message = jsonParse["message"] as? String
                        status  = jsonParse["status"] as? String
                        
                        //debugPrint(message!, status!)
                        
                        if (status == "Success") {
                            print(message!)
                            
                            DispatchQueue.main.async {
                                self.nameField.text = ""
                                self.lastNameField.text = ""
                                self.emailField.text = ""
                                self.passField.text = ""
                                self.passFieldAgain.text = ""
                            }
                        }
                    }
                }
                catch {
                    print("Error")
                }
            }
        }
        
        task.resume()
        
    }
    

}
