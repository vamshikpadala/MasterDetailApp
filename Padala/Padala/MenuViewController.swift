//
//  MenuViewController.swift
//  iphoneApp
//
//  Created by Vamshi krishna Padala on 12/12/16.
//  Copyright © 2016 Vamshi krishna Padala. All rights reserved.
//

import UIKit
import WebKit

class MenuViewController: UIViewController {
	
	@IBOutlet weak var menuBtn: UIBarButtonItem!
	@IBOutlet weak var logoutBtn: UIBarButtonItem!
	@IBOutlet weak var cfImageView: UIView!
	@IBOutlet weak var incImage: UIImageView!
	@IBOutlet weak var staffImage: UIImageView!
	@IBOutlet weak var systemImage: UIImageView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.barTintColor = UIColor.orange
		menuBtn.tintColor = UIColor.white
		navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name:"AvenirNext-Medium", size: 24)!]
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor .white]
		navigationController?.navigationBar.topItem?.title = "Welcome"
		
		if revealViewController() != nil {
			menuBtn.target = self.revealViewController()
			menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		
		cfImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
	}
	
	@IBAction func rightBarButtonTapped(_ sender: Any) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ViewController")
		self.present(viewController!, animated: true, completion: nil)
	}
}
