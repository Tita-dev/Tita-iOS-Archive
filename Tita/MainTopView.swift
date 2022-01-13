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
        $0.text = "광주소프트웨어마이스터고"
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
        [headLabel].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(viewBounds.height/18.45)
            make.left.equalTo(viewBounds.width/26.79)
        }
    }
}
