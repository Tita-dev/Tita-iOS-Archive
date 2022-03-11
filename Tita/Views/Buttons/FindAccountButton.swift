//
//  FindAccountButton.swift
//  Tita
//
//  Created by 혜인 on 2022/03/10.
//

import UIKit

class FindAccountButton: UIButton {
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
        self.backgroundColor = .white
        self.layer.cornerRadius = UIScreen.main.bounds.width/37.5
        self.layer.borderWidth = UIScreen.main.bounds.width/375
        self.layer.borderColor = UIColor.rgb(red: 205, green: 205, blue: 205).cgColor
        self.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Light")
        self.setTitleColor(.rgb(red: 133, green: 133, blue: 133), for: .normal)
    }
    
    func dataSetting(title: String?){
        self.setTitle(title, for: .normal)
    }
}
