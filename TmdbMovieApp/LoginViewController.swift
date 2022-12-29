//
//  LoginViewController.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 26.12.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "toMain", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
