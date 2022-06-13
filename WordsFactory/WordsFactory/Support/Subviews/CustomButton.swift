//
//  CustomButton.swift
//  WordsFactory
//
//  Created by Максим Неверовский on 13.06.2022.
//

import UIKit

struct CustomButtonViewModel {
    let titleText: String
}

class CustomButton: UIButton {
    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.rubik(.medium, size: 16)
        
        return label
    }()
    
    convenience init() {
            self.init(type: .system)
        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        clipsToBounds = false
        layer.cornerRadius = 13
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: CustomButtonViewModel){
        title.text = viewModel.titleText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    

}

/*let customButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 311, height: 56))
view.addSubview(customButton)
customButton.center = view.center
customButton.configure(with: CustomButtonViewModel(
    titleText:"Add to Dictionary"
))*/
