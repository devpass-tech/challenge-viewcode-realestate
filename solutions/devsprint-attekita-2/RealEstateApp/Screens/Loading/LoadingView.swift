//
//  LoadingView.swift
//  RealEstateApp
//
//  Created by Camila Ribeiro Rodrigues on 15/03/22.
//

import UIKit


final class LoadingView: UIView {
	private enum Strings {
		static let loadingText = "Searching for listings..."
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var loadingLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.text = Strings.loadingText
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var activityView: UIActivityIndicatorView = {
		let activityView = UIActivityIndicatorView()
		activityView.translatesAutoresizingMaskIntoConstraints = false
		activityView.center = self.center
		activityView.style = .medium
		activityView.color = .gray
		activityView.startAnimating()
		return activityView
	}()
	
	private func setupUI() {
		loadSubViews()
		setupConstraints()
	}
	
	private func loadSubViews() {
		addSubview(loadingLabel)
		addSubview(activityView)
	}
	
	private func setupConstraints() {
		loadingLabel.bottomAnchor.constraint(equalTo: activityView.topAnchor, constant: -20).isActive = true
		loadingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
	}
}
