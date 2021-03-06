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
    private let viewBounds = UIScreen.main.bounds
    
    private let headLabel = UILabel().then {
        $0.text = "광주소프트웨어마이스터고등학교"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    let bellButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-Bell"), for: .normal)
    }
    
    let profileButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-Profile"), for: .normal)
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
        [headLabel, bellButton, profileButton].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(viewBounds.height/18.45)
            make.left.equalTo(viewBounds.width/26.79)
        }
        
        bellButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/15.63)
            make.height.equalTo(viewBounds.height/33.83)
            make.centerY.equalTo(headLabel)
            make.right.equalTo(profileButton.snp.left).offset(viewBounds.width/(-46.88))
        }
        
        profileButton.snp.makeConstraints { make in
            make.width.height.equalTo(bellButton)
            make.centerY.equalTo(bellButton)
            make.right.equalTo(viewBounds.width/(-26.79))
        }
    }
}
