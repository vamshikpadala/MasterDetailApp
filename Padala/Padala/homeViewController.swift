//
//  homeViewController.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 12/16/16.
//  Copyright © 2016 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class homeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField : UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPwd: UIButton!
    @IBOutlet weak var forgotUname: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
    usernameField.delegate = self
    passwordField.delegate = self
    signInButton.layer.shadowRadius = 8
    signInButton.layer.shadowOpacity = 8
    signInButton.layer.shadowColor = UIColor.lightGray.cgColor
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
    view.addGestureRecognizer(tap)
   
    }
    @IBAction func logOut(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(viewController!, animated: true)
        
    }
    @IBAction func SignInTapped(_ sender: Any) {
      
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
        navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func forgotPwdTapped(_sender : Any){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ForgotPassword")
        navigationController?.pushViewController(viewController!, animated: true)
        
    }
    @IBAction func forgotUsernameTapped(_sender : Any){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ForgotUsername")
        navigationController?.pushViewController(viewController!, animated: true)
        
    }
 func dismissKeyboard() {
    self.usernameField.resignFirstResponder()
    self.passwordField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let uName = usernameField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            uName.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            usernameField.resignFirstResponder()
        }
        if let pWord = passwordField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            pWord.becomeFirstResponder()
        }else {
            passwordField.resignFirstResponder()
        }
        return false
    }

}
