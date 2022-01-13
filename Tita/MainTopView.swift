//
//  MainTopView.swift
//  Tita
//
//  Created by 혜인 on 2022/01/13.
//

import UIKit
import SnapKit
import Then

class MainTopView: UIView {

// MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
        
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
    }
        
    // MARK: - addView
    private func addView(){
        
    }
            
    // MARK: - location
    private func location(){
        
    }
}
