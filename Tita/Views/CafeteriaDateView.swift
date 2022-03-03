//
//  CafeteriaDateView.swift
//  Tita
//
//  Created by 혜인 on 2022/03/03.
//

import UIKit

class CafeteriaDateView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    let lastDayButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-ChevronDown_left"), for: .normal)
    }
    
    let dateLabel = UILabel().then {
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    let nextDayButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-ChevronDown_right"), for: .normal)
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
        [lastDayButton, dateLabel, nextDayButton].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        lastDayButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/12.5)
            make.height.equalTo(viewBounds.height/27.01)
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        nextDayButton.snp.makeConstraints { make in
            make.width.height.centerY.equalTo(lastDayButton)
            make.right.equalToSuperview()
        }
    }
}
