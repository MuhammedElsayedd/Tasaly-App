//
//  LoginSuccess.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/17/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import UIKit

class LoginSuccess: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
           // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.performSegue(withIdentifier: "searchSegue", sender: nil)
        }
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

