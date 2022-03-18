//
//  LoginButton.swift
//  Tita
//
//  Created by 노연주 on 2022/01/18.
//

import UIKit

class LoginButton: UIButton {
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
        self.backgroundColor = .rgb(red: 123, green: 176, blue: 222)
        self.layer.cornerRadius = UIScreen.main.bounds.width/37.5
        self.layer.applySketchShadow(color: UIColor.black, alpha: 0.25, x: 2, y: 2, blur: 10, spread: 0)
        self.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        self.setTitleColor(.white, for: .normal)
    }
    
    func dataSetting(title: String?){
        self.setTitle(title, for: .normal)
    }
}
