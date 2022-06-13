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
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.rubik(.medium, size: 16)
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        clipsToBounds = true
        layer.cornerRadius = 16
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
        title.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/2)
    }
    

}
