//
//  Case3TableViewCell.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class WithClosure2TableViewCell: UITableViewCell {
    
    static let identifier = "case3Cell"
    
    var buttonTapHandler: (()->Void)?
    
    private let button : UIButton = {
        var button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
    }
    
    @objc func buttonTapped(){
        buttonTapHandler?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 30, y: 0, width: 100, height: self.frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
