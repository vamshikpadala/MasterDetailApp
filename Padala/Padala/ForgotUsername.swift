//
//  ForgotUsername.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/9/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class ForgotUsername: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var navBar: UINavigationBar!
	@IBOutlet weak var barButtonItem: UIBarButtonItem!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var doneButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		emailTextField.delegate = self
		doneButton.layer.opacity = 8
		doneButton.layer.shadowRadius = 8
		doneButton.layer.shadowColor = UIColor.lightGray.cgColor
	}
	
	@IBAction func backTapped(_ sender: Any) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
		navigationController?.pushViewController(viewController!, animated: true)
	}
	
	@IBAction func doneTapped(_ sender: Any) {
		
		let alert = UIAlertController(title: "Email Sent", message: "We sent you a email with your username", preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
}
