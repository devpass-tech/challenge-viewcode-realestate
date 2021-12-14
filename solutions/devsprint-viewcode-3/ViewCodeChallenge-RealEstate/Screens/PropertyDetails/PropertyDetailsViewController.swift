//
//  PropertyDetailsViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyDetailsViewController: UIViewController {
    // MARK: Properties
    private lazy var customView: UIView = {
        let view = PropertyDetailsView()
        return view
    }()
    
    // MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apartamento para comprar"
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PropertyDetailsViewControllerPreview: PreviewProvider {
    static var previews: some View {
            let usersViewController = PropertyDetailsViewController()
            return UINavigationController(rootViewController: usersViewController)
                .preview
        }
}
#endif


