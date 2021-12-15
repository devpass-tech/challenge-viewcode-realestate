//
//  AccountViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 06/12/21.
//

import UIKit

class AccountViewController: UIViewController {

    override func loadView() {
        super.loadView()
        let accountView = AccountView()
        accountView.delegate = self
        view = accountView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AccountViewController: AccountViewDelegate {
    func didTappedButton() {
            // TODO: button pressed
    }
}
