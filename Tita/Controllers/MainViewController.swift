//
//  MainViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/01/10.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    
    //MARK: - Properties
    private let topView = MainTopView()
    
    
    
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
        [topView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        topView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(29)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct MainViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MainViewController()
    }
}
@available(iOS 13.0, *)
struct MainControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MainViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
