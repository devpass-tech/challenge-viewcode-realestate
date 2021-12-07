//
//  DividerView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Guilherme Strutzki on 07/12/21.
//

import UIKit

struct DividerViewModel {
    let color: UIColor?
    let height: CGFloat?
}

final class DividerView: UIView {
    private let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with configuration: DividerViewModel) {
        dividerView.backgroundColor = configuration.color ?? .lightGray
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: configuration.height ?? 2)
        ])
    }
}

extension DividerView: ViewCode {
    func configureSubviews() {
        addSubview(dividerView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configureAdditionalBehaviors() {}
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct FeaturePreviews: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let dividerView = DividerView()
            dividerView.configure(with: DividerViewModel(color: .blue,
                                                                 height: 2))
            return dividerView
        }
        .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                              height: 2))
    }
}
#endif
