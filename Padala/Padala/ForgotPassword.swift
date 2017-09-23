//
//  ForgotPassword.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/9/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class ForgotPassword: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.opacity = 8
        doneButton.layer.shadowRadius = 8
        doneButton.layer.shadowColor = UIColor.lightGray.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Email Sent", message: "We sent you a email with a link to reset your password", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
