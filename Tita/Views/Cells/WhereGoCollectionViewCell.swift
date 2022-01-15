//
//  WhereGoCollectionViewCell.swift
//  Tita
//
//  Created by 혜인 on 2022/01/15.
//

import UIKit
import SnapKit
import Then

class WhereGoCollectionViewCell: UICollectionViewCell {
    //MARK: - property
    static let identifier = "\(WhereGoCollectionViewCell.self)"
    private let viewBounds = UIScreen.main.bounds
    
    let iconImg = UIImageView()
    
    let title = UILabel().then {
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo")
    }
    
    let subTitle = UILabel().then {
        $0.dynamicFont(fontSize: 7, currentFontName: "AppleSDGothicNeo")
    }
    
    //MARK: - lifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        location()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addView
    private func addView() {
        [iconImg, title, subTitle].forEach { self.addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        iconImg.snp.makeConstraints { make in
            make.width.height.equalTo(viewBounds.height/3.25)
            make.top.equalTo(viewBounds.height/8.13)
            make.left.equalTo(viewBounds.width/14.44)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(iconImg)
            make.top.equalTo(iconImg.snp.bottom).offset(viewBounds.height/10)
        }
        
        subTitle.snp.makeConstraints { make in
            make.left.equalTo(title)
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/43.33)
        }
    }
}


