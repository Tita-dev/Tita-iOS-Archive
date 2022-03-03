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
    
    let menu = UILabel().then {
        $0.dynamicFont(fontSize: 15, currentFontName: "AppleSDGothicNeo-Regular")
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
        self.backgroundColor = .white
        self.layer.applySketchShadow(color: .rgb(red: 0, green: 0, blue: 0), alpha: 0.25, x: 0, y: 4, blur: 10, spread: 0)
        self.layer.cornerRadius = viewBounds.width/12.5
        
        addView()
        location()
    }
        
    // MARK: - addView
    private func addView(){
        [icon, title, menu].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        icon.snp.makeConstraints { make in
            make.top.equalTo(viewBounds.height/42.74)
            make.left.equalTo(viewBounds.width/13.39)
            make.width.equalTo(viewBounds.width/15)
            make.height.equalTo(viewBounds.height/32.48)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(icon)
            make.centerX.equalToSuperview()
        }
        
        menu.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(iconName: String, titleName: String, menuName: String) {
        icon.image = UIImage(named: iconName)
        title.text = titleName
        menu.text = menuName
    }
}
