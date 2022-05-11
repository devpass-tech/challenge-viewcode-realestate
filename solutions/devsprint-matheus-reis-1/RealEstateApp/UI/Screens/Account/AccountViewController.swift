//
//  AccountViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 06/12/21.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        view = LoginView()
    }
}
