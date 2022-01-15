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
        self.backgroundColor = .white
        self.layer.applySketchShadow(color: .rgb(red: 0, green: 0, blue: 0), alpha: 0.25, x: 2, y: 2, blur: 4, spread: 0)
        self.layer.cornerRadius = viewBounds.width/12.5
        
        iconImg.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/9.38)
            make.height.equalTo(viewBounds.height/20.3)
            make.top.equalTo(viewBounds.height/50.75)
            make.left.equalTo(viewBounds.width/41.67)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(iconImg)
            make.top.equalTo(iconImg.snp.bottom).offset(viewBounds.height/62.46)
        }
        
        subTitle.snp.makeConstraints { make in
            make.left.equalTo(title)
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/270.67)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(Image: String, titleText: String, subTitleText: String) {
        iconImg.image = UIImage(named: Image)
        title.text = titleText
        subTitle.text = subTitleText
    }
}


