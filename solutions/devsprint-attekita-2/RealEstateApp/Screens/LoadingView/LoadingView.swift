//
//  LoadingView.swift
//  RealEstateApp
//
//  Created by Camila Ribeiro Rodrigues on 15/03/22.
//

import UIKit

final class LoadingView: UIView {
	private enum Strings {
		static let loadingText = "Searching for lists..."
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var loadingLabel: UILabel = {
		let label = UILabel()
		label.text = Strings.loadingText
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var activityView: UIActivityIndicatorView = {
		let activityView = UIActivityIndicatorView(style: .whiteLarge)
		activityView.translatesAutoresizingMaskIntoConstraints = false
		activityView.center = self.center
		activityView.color = .black
		activityView.startAnimating()
		return activityView
	}()
	
	private func loadSubViews() {
		addSubview(loadingLabel)
		addSubview(activityView)
	}
	
	private func setupConstraints() {
		loadingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		loadingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		activityView.topAnchor.constraint(equalTo: loadingLabel.bottomAnchor).isActive = true
		activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
	}
}
