//
//  EmptyPostView.swift
//  Tita
//
//  Created by 혜인 on 2022/01/17.
//

import UIKit

class EmptyPostView: UIView {
    private let viewBounds = UIScreen.main.bounds
  
    let noticeText = UILabel().then {
        $0.text = "아직 주요 공지글이 없어요!"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .rgb(red: 112, green: 112, blue: 112)
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
        self.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 4, blur: 10, spread: 0)
        self.layer.cornerRadius = viewBounds.width/18.75
        
        addView()
        location()
    }
        
    // MARK: - addView
    private func addView(){
        [noticeText].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        noticeText.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
