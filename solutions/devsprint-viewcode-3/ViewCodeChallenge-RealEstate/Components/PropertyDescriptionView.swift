import UIKit

struct PropertyDescriptionViewConfiguration {
    var description: String
}

final class PropertyDescriptionView: UIView {
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Descrição"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.textColor = .black
        textView.backgroundColor = .clear
        textView.contentMode = .left
        textView.isEditable = false
        textView.isSelectable = true
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.maximumNumberOfLines = 5
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var seeMoreButton: ButtonView = {
        let button = ButtonView()
        let buttonViewModel = ButtonViewConfiguration (title: "Ver mais", pressedButton: nil)
        button.configure(with: buttonViewModel)
        
        return button
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewConfiguration: PropertyDescriptionViewConfiguration) {
        descriptionTextView.text = viewConfiguration.description
    }
}

extension PropertyDescriptionView: ViewCode {
    func configureSubviews() {
        addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(descriptionTextView)
        descriptionStackView.addArrangedSubview(seeMoreButton)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            descriptionStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            descriptionStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            descriptionStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            descriptionStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }
    func configureAdditionalBehaviors() {}
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PropertyDescriptionViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let dividerView = PropertyDescriptionView()
       
            return dividerView
        }
        .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                              height: 100))
    }
}
#endif
