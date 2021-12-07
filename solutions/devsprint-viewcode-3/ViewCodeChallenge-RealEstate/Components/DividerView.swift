//
//  DividerView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Guilherme Strutzki on 07/12/21.
//

import UIKit

final class DividerView: UIView {
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 1)
    }
}

extension DividerView: ViewCode {
    func configureSubviews() {}
    
    func configureSubviewsConstraints() {}
    
    func configureAdditionalBehaviors() {
        self.backgroundColor = .lightGray
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct FeaturePreviews: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let dividerView = DividerView()
       
            return dividerView
        }
        .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                              height: 100))
    }
}
#endif
