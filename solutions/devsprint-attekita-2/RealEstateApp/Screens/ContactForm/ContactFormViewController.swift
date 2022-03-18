//
//  ContactFormViewController.swift
//  RealEstateApp
//
//  Created by Bruno Silva on 17/03/22.
//

import UIKit

class ContactFormViewController: UIViewController {
    
    // MARK: - Variables
    private let contactForm: ContactFormView = ContactFormView()
    
    // MARK: - LifeCycle
    override func loadView() {
        view = contactForm
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
