//
//  NoticeLabelView.swift
//  Tita
//
//  Created by 혜인 on 2022/01/17.
//

import UIKit

class NoticeLabelView: UIView {
    private let viewBounds = UIScreen.main.bounds

    let label = UILabel().then {
        $0.text = "주요 공지글"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    let button = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(UIColor.rgb(red: 152, green: 152, blue: 152), for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
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
        [label, button].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(viewBounds.width/26.79)
        }
        
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.equalTo(viewBounds.width/(-17.86))
        }
    }
}
