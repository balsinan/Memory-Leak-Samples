//
//  Case4TableViewCell.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

protocol CustomViewDelegate: AnyObject {
  func didTapButton()
}

class WithProtocolTableViewCell: UITableViewCell {
    
    static let identifier = "case4Cell"
    
    private let button : UIButton = {
        var button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // to fix ->  // To Fix: We need declare this variable as weak.
    var delegate : CustomViewDelegate?
    //weak var delegate : CustomViewDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
    }
    
    @objc func buttonTapped(){
        delegate?.didTapButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 30, y: 0, width: 100, height: self.frame.height)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
