//
//  SignUpDescriptionView.swift
//  Tita
//
//  Created by 혜인 on 2022/01/27.
//

import UIKit
import SnapKit
import Then

class SignUpDescriptionView: UIView {
    private let viewBounds = UIScreen.main.bounds

    private let logo = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    
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
        [logo].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        logo.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/3.22)
            make.height.equalTo(viewBounds.height/19.33)
            make.top.equalToSuperview()
            make.left.equalTo(viewBounds.width/15.63)
        }
    }
}
