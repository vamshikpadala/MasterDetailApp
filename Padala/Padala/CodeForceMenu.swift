//
//  CodeForceMenu.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/9/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class CodeForceMenu: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var cfLogo: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    var menuArray:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuArray = ["Home","About Us","Staffing","Outsourcing","Digital","Technology","Diversity", "Jobzone","Contact Us"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        
        cell.menuLabel.text! = menuArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let cell: MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        print(cell.menuLabel.text!)
        if cell.menuLabel.text! == "Home"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "CFHome") as! CFHomeViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
            
        }
        
        if cell.menuLabel.text! == "About Us"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "AboutUs") as! AboutUsViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.menuLabel.text! == "Staffing"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Staffing") as! StaffingViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
            
        }
        if cell.menuLabel.text! == "Outsourcing"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Outsourcing") as! OutsourcingViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.menuLabel.text! == "Digital"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Digital") as! DigitalViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.menuLabel.text! == "Technology"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Technology") as! TechnologyViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.menuLabel.text! == "Diversity"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Diversity") as! DiversityViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.menuLabel.text! == "Jobzone"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "JobZone") as! JobZoneViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.menuLabel.text! == "Contact Us"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ContactUs") as! ContactUsViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
