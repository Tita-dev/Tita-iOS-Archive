//
//  FindAccountViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/10.
//

import UIKit
import SnapKit
import Then

class FindAccountViewController: UIViewController {
    //MARK: - Properties
    private let logo = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    
    private let aboutTita = UILabel().then {
        $0.text = "우리만의 공간, Time-Table"
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .black
    }
    
    private let findID = FindAccountButton().then {
        $0.dataSetting(title: "아이디 찾기")
    }
    
    private let findPW = FindAccountButton().then {
        $0.dataSetting(title: "비밀번호 찾기")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [logo, aboutTita, findID, findPW].forEach{ view.addSubview($0) }
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/3.59)
            make.width.equalToSuperview().dividedBy(3.46)
            make.height.equalToSuperview().dividedBy(20.12)
        }
        
        aboutTita.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logo.snp.bottom).offset(self.view.frame.height/174.62)
        }
        
        findID.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(aboutTita.snp.bottom).offset(self.view.frame.height/15.62)
            make.width.equalToSuperview().dividedBy(1.43)
            make.height.equalToSuperview().dividedBy(19.33)
        }
        
        findID.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(aboutTita.snp.bottom).offset(self.view.frame.height/62.46)
            make.width.equalToSuperview().dividedBy(1.43)
            make.height.equalToSuperview().dividedBy(19.33)
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        FindAccountViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
