//
//  CafeteriaTopView.swift
//  Tita
//
//  Created by 혜인 on 2022/03/02.
//

import UIKit

class CafeteriaTopView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    let previousButton = UIButton().then {
       $0.setImage(UIImage(named: "Tita-Previous"), for: .normal)
    }

    let pageName = UILabel().then {
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Bold")
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
        [previousButton, pageName].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        previousButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/17.86)
            make.height.equalTo(viewBounds.height/40.6)
            make.top.equalToSuperview()
            make.left.equalTo(viewBounds.width/15.63)
        }
        
        pageName.snp.makeConstraints { make in
            make.centerY.equalTo(previousButton)
            make.left.equalTo(previousButton.snp.right).offset(viewBounds.width/25)
        }
    }
}
