//
//  CFHomeViewController.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/9/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class CFHomeViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        webView.delegate = self
        
        navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Medium", size: 24)!]
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor .white]
        navigationController?.navigationBar.topItem?.title = "Home"
        
        navigationController?.navigationBar.barTintColor = UIColor.orange
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ham"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Logout1"), style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        if let url = URL(string: "http://www.codeforce.com/") {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        
    }
    func logout(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(viewController!, animated: true)
        
    }
}
