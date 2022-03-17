//
//  LineView.swift
//  Tita
//
//  Created by 혜인 on 2022/02/22.
//

import UIKit

class LineView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    private let line1 = UIView().then {
        $0.backgroundColor = .rgb(red: 123, green: 176, blue: 222)
    }
    
    private let line2 = UIView().then {
        $0.backgroundColor = .rgb(red: 123, green: 176, blue: 222)
    }
    
    private let line3 = UIView().then {
        $0.backgroundColor = .rgb(red: 123, green: 176, blue: 222)
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
        [line1, line2, line3].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        line1.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/4.98)
            make.height.equalTo(viewBounds.height/812)
            make.left.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        line2.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/4.98)
            make.height.equalTo(viewBounds.height/812)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        line3.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/4.98)
            make.height.equalTo(viewBounds.height/812)
            make.left.equalTo(line2.snp.right).offset(viewBounds.width/30.81)
            make.top.equalToSuperview()
        }
    
    }
}
