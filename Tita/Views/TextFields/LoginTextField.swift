//
//  LoginTextField.swift
//  Tita
//
//  Created by 노연주 on 2022/01/19.
//

import UIKit

class LoginTextField: UITextField {
    // MARK: - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    private func configureUI(){
        self.backgroundColor = .rgb(red: 243, green: 243, blue: 243)
        self.layer.cornerRadius = UIScreen.main.bounds.width/37.5
        self.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Light")
        self.setPlaceholderColor(.rgb(red: 133, green: 133, blue: 133))
        self.textColor = .black
        self.setLeftPaddingPoints(UIScreen.main.bounds.width/20.83)
    }
    
    func dataSetting(placeholderText: String?){
        self.placeholder = placeholderText
    }
}
