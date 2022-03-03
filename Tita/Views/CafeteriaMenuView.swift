//
//  CafeteriaMenuView.swift
//  Tita
//
//  Created by 혜인 on 2022/03/03.
//

import UIKit

class CafeteriaMenuView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    let icon = UIImageView().then {
        $0.image = UIImage(named: "Tita-Breakfast")
    }
    
    let title = UILabel().then {
        $0.dynamicFont(fontSize: 18, currentFontName: "AppleSDGothicNeo-Bold")
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
        [icon, title].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        icon.snp.makeConstraints { make in
            make.top.equalTo(viewBounds.height/42.74)
            make.left.equalTo(viewBounds.width/13.39)
            make.width.equalToSuperview().dividedBy(15)
            make.height.equalToSuperview().dividedBy(32.48)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(icon)
            make.centerX.equalToSuperview()
        }
    }
}
