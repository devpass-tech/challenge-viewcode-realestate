//
//  AccountViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 06/12/21.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = "Account"
    }
    
    
    override func loadView() {
        self.view = LoginView(frame: .zero)

    }
}
