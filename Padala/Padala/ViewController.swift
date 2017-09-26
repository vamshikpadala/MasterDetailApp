//
//  ViewController.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 12/16/16.
//  Copyright © 2016 Vamshi krishna Padala. All rights reserved.
//

import UIKit
import Foundation
import LocalAuthentication

class ViewController: UIViewController {
	
	@IBOutlet weak var cfLogo: UIImageView!
	@IBOutlet weak var welcomeLabel: UILabel!
	@IBOutlet weak var signInBtn: UIButton!
	@IBOutlet weak var signUpBtn: UIButton!
	let BtnAnimationDuration: CGFloat = 2.0
	
	let scaleConstant: CGFloat = 1.0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		cfLogo.layer.shadowRadius = 8
		cfLogo.layer.cornerRadius = 8
		cfLogo.layer.shadowOpacity = 10
		cfLogo.layer.shadowColor = UIColor.lightGray.cgColor
		signInBtn.layer.shadowRadius = 8
		signInBtn.layer.shadowOpacity = 8
		signInBtn.layer.shadowColor = UIColor.lightGray.cgColor
		signUpBtn.layer.shadowRadius = 8
		signUpBtn.layer.shadowOpacity = 8
		signUpBtn.layer.shadowColor = UIColor.lightGray.cgColor
		signUpBtn.alpha = 0
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		animateButton()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.navigationBar.isHidden = true
	}
	
	@IBAction func SignIn(_ sender: Any) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
		navigationController?.pushViewController(viewController!, animated: true)
		
		touchID()
	}
	
	@IBAction func SignUp(_ sender: Any) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
		navigationController?.pushViewController(viewController!, animated: true)
	}
	
	func animateButton() {
		
		UIView.animate(withDuration: TimeInterval(BtnAnimationDuration), delay: 1.0, options: .curveEaseInOut, animations: { () -> Void in
			self.signUpBtn.alpha = 1
			self.signUpBtn.transform = CGAffineTransform(scaleX: self.scaleConstant, y: self.scaleConstant) })
	}
	
	func touchID() {
		
		let authUser : LAContext = LAContext()
		var touchIdError : NSError?
		
		guard authUser.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &touchIdError) else {
			
			showAlertViewIfNoBiometricSensorHasBeenDetected()
			return
		}
		
		authUser.evaluatePolicy( .deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please use Touch ID to Sign in", reply: { [unowned self] (success, error) -> Void in
			
			if( success ) {
				self.navigateToAuthenticatedViewController()
			}
		})
	}
	
	func showAlertViewIfNoBiometricSensorHasBeenDetected() {
		
		showAlertWithTitle(title: "Error", message: "Please setup Touch ID or login with your login credentials")
	}
	
	func showAlertWithTitle( title:String, message:String ) {
		
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
		alertVC.addAction(okAction)
		
		DispatchQueue.main.async() { () -> Void in
			
			self.present(alertVC, animated: true, completion: nil)
		}
	}
	
	func navigateToAuthenticatedViewController() {
		
		if let loggedInVC = storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") {
			
			DispatchQueue.main.async() { () -> Void in
				
				self.navigationController?.pushViewController(loggedInVC, animated: true)
			}
		}
	}
}

