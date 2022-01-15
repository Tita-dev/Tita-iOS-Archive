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
    
    let iconImg = UIImage()
    
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
        [].forEach { self.addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        
    }
}


