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
        [lastDayButton].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        lastDayButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/12.5)
            make.height.equalTo(viewBounds.height/27.01)
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
