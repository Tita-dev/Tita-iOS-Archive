//
//  MainPostTableViewCell.swift
//  Tita
//
//  Created by 혜인 on 2022/01/16.
//

import UIKit
import SnapKit
import Then

class MainPostTableViewCell: UITableViewCell {
    
    //MARK: - property
    static let identifier = "\(MainPostTableViewCell.self)"
    private let viewBounds = UIScreen.main.bounds
    
    let title = UILabel().then {
        $0.text = "체육대회 공지사항"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    let text = UILabel().then {
        $0.text = "체육대회 당일 오후 우천으로 인한 일정 변동이 있습니다. 모든 학생들은 확인해주시기 바랍니다./n또한, 첨부한 사진에 오타가 있습니다. 농구 경기의 경우 60분이니 확인 부탁드립니다."
        $0.dynamicFont(fontSize: 7, currentFontName: "AppleSDGothicNeo-Light")
        $0.numberOfLines = 0
    }
    
    let writer = UILabel().then {
        $0.text = "학생회"
        $0.dynamicFont(fontSize: 9, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    let icon = UIImageView().then {
        $0.image = UIImage(named: "Tita-Pin")
    }
   
    //MARK: - lifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        self.layer.applySketchShadow(color: .rgb(red: 0, green: 0, blue: 0), alpha: 0.25, x: 2, y: 2, blur: 4, spread: 0)
        self.layer.cornerRadius = viewBounds.width/37.5
        
        addView()
        location()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - addView
    private func addView() {
        [title, text, writer, icon].forEach { contentView.addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        title.snp.makeConstraints { make in
            make.top.equalTo(viewBounds.height/50)
            make.left.equalTo(viewBounds.width/20.83)
        }
        
        text.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/135.33)
            make.left.equalTo(title)
            make.height.equalTo(viewBounds.height/45.11)
            make.width.equalTo(viewBounds.width/1.44)
        }
        
        writer.snp.makeConstraints { make in
            make.centerY.equalTo(title)
            make.right.equalTo(viewBounds.width/(-34.09))
        }
        
        icon.snp.makeConstraints { make in
            make.top.equalTo(writer.snp.bottom).offset(viewBounds.height/162.4)
            make.right.equalTo(writer)
        }
        
    }
}
