//
//  PropertyDescriptionViewController.swift
//  RealEstateApp
//
//  Created by Camila Ribeiro Rodrigues on 22/03/22.
//

import UIKit

final class PropertyDescriptionViewController: UIViewController {
	
	private var propertyMoreDescriptionView: PropertyMoreDescriptionView?
	private var textDescription: String
	private var titleDescription: String
	
	init(textDescription: String, titleDescription: String) {
		self.textDescription = textDescription
		self.titleDescription = titleDescription
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		super.loadView()
		propertyMoreDescriptionView = PropertyMoreDescriptionView()
		view = propertyMoreDescriptionView
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.isNavigationBarHidden = false
		title = self.titleDescription
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		propertyMoreDescriptionView?.configure(with: textDescription)
	}
}
