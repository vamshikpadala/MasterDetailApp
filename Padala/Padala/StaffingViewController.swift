//
//  StaffingViewController.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/9/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit
import Foundation

class StaffingViewController: UIViewController, UIWebViewDelegate {
	
	@IBOutlet weak var webView: UIWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		webView.delegate = self
		
		navigationController?.navigationBar.barTintColor = UIColor.orange
		navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 24)!]
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor .white]
		navigationController?.navigationBar.topItem?.title = "Staffing"
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ham"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
		navigationItem.leftBarButtonItem?.tintColor = UIColor.white
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Logout1"), style: .plain, target: self, action: #selector(logout))
		navigationItem.rightBarButtonItem?.tintColor = UIColor.white
		
		if let url = URL(string: "http://www.codeforce.com/staffing/staff-augmentation/") {
			let request = URLRequest(url: url)
			webView.loadRequest(request)
		}
	}
	
	@objc func logout() {
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ViewController")
		self.present(viewController!, animated: true, completion: nil)
	}
}
