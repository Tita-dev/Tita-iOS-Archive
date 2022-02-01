//
//  SignUpTextFieldView.swift
//  Tita
//
//  Created by 혜인 on 2022/01/30.
//

import UIKit
import SwiftUI

class SignUpTextFieldView: UIView{
    private let viewBounds = UIScreen.main.bounds
    
    let label = UILabel().then {
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    let textField = UITextField().then {
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    private let line = UIView().then {
        $0.backgroundColor = .black
    }
    
    let visibilityButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-EyeSlash"), for: .normal)
        $0.isHidden = true
    }
    
    let errorLabel = UILabel().then {
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .rgb(red: 219, green: 64, blue: 64)
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
        [label, textField, line, visibilityButton, errorLabel].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(viewBounds.height/25.38)
            make.left.equalToSuperview()
            make.height.equalTo(viewBounds.height/45.11)
            make.width.equalTo(viewBounds.width/1.27)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom)
            make.left.equalToSuperview()
            make.height.equalTo(viewBounds.height/812)
            make.width.equalTo(viewBounds.width/1.15)
        }
        
        visibilityButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(viewBounds.height/36.9)
            make.left.equalTo(label.snp.right).offset(viewBounds.width/1.53)
            make.height.equalTo(viewBounds.height/36.9)
            make.width.equalTo(viewBounds.width/17.04)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(viewBounds.height/101.5)
            make.left.equalToSuperview()
        }
    }
    
    // MARK: - DataSetting
    func dataSetting(labelText: String){
        label.text = labelText
    }
}
