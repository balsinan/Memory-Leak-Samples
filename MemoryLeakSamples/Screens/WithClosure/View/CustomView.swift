//
//  CustomView.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class CustomView : UIView{
    
    var tapHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView(){
        self.backgroundColor = .red
        self.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func tapView(){
        tapHandler?()
    }
}
