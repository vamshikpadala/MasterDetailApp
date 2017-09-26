//
//  HomeViewController.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 12/16/16.
//  Copyright © 2016 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet weak var usernameField : UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var signInButton: UIButton!
	@IBOutlet weak var forgotPwd: UIButton!
	@IBOutlet weak var forgotUname: UIButton!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		usernameField.delegate = self
		passwordField.delegate = self
		signInButton.layer.shadowRadius = 8
		signInButton.layer.shadowOpacity = 8
		signInButton.layer.shadowColor = UIColor.lightGray.cgColor
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
		view.addGestureRecognizer(tapGesture)
		
		self.navigationController?.navigationBar.isHidden = false
		self.title = "Sign In"
	}
	
	@IBAction func logOut(_ sender: Any) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ViewController")
		navigationController?.pushViewController(viewController!, animated: true)
	}
	
	@IBAction func SignInTapped(_ sender: Any) {
		
		let storyboard = UIStoryboard(name: "Menu", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
		self.present(viewController!, animated: true, completion: nil)
	}
	
	@IBAction func forgotPwdTapped(_ sender : Any){
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ForgotPassword")
		navigationController?.pushViewController(viewController!, animated: true)
	}
	
	@IBAction func forgotUsernameTapped(_ sender : Any){
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ForgotUsername")
		navigationController?.pushViewController(viewController!, animated: true)
	}
	
	@objc func hideKeyboard() {
		
		if usernameField.isFirstResponder {
			usernameField.resignFirstResponder()
		} else if passwordField.isFirstResponder {
			passwordField.resignFirstResponder()
		}
	}
}

extension HomeViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		if usernameField.isFirstResponder {
			usernameField.resignFirstResponder()
			passwordField.becomeFirstResponder()
		} else if passwordField.isFirstResponder {
			passwordField.resignFirstResponder()
		}
		return true
	}
}
