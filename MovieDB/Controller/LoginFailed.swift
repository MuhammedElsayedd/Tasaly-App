//
//  CantLogin.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/17/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import UIKit

class LoginFailed: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tryAgainBtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
