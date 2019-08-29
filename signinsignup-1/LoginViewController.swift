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
        
        let urlString = "http://localhost:8888/signinsignup/login.php"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //Ödev????
            
            if error != nil {
                print("ERROR")
            }
            
            else {
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
                                
                                let storybord:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                
                                let homeVC = storybord.instantiateViewController(withIdentifier: "HomePage") as! HomeViewController
                                
                                self.present(homeVC, animated: true, completion: nil)
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

