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
    
    let previousButton = UIButton().then {
       $0.setImage(UIImage(named: "Tita-Previous"), for: .normal)
    }

    private let logo = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    
    let descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "안녕하세요, 여러분!\n우리만의 공간으로 들어가볼까요?"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    let additionalDescriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Regular")
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
        [previousButton, logo, descriptionLabel, additionalDescriptionLabel].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        
        previousButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/17.86)
            make.height.equalTo(viewBounds.height/40.6)
            make.top.equalToSuperview()
            make.left.equalTo(viewBounds.width/15.63)
        }
        logo.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/3.22)
            make.height.equalTo(viewBounds.height/19.33)
            make.top.equalTo(previousButton.snp.bottom).offset(viewBounds.height/13.1)
            make.left.equalTo(previousButton)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(viewBounds.height/45.11)
            make.left.equalTo(logo)
        }
        
        additionalDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(viewBounds.height/116)
            make.left.equalTo(descriptionLabel)
        }
    }
    
    // MARK: - DataSetting
    func dataSetting(description: String){
        descriptionLabel.text = description
    }
    
    func dataSetting(description: String, additionalDescription: String){
        descriptionLabel.text = description
        additionalDescriptionLabel.text = additionalDescription
    }
}
