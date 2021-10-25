//
//  ButtonViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Diego Llopis on 21/10/21.
//

import UIKit

class ButtonViewController: UIViewController {
    
    var buttonView: ButtonView?
    
    override func loadView() {
        buttonView = ButtonView()
        self.view = buttonView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        buttonView?.setButtonTitle("Teste")
        buttonView?.buttonViewDelegate(delegate: self)
    }
}

extension ButtonViewController: ButtonViewProtocol {
    
    func buttonPressAction() {
        print("Botão 1 funcionando!")
    }
    
    
}
