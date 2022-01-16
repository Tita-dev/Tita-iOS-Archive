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
    
   
    //MARK: - lifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        [].forEach { contentView.addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
 
        
    }
}
