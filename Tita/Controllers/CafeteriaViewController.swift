//
//  CafeteriaViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/02.
//

import UIKit
import SnapKit
import Then

class CafeteriaViewController: UIViewController {
    //MARK: - Properties
    private let topView = CafeteriaTopView().then {
        $0.pageName.text = "오늘의 급식"
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let dateView = CafeteriaDateView().then {
        $0.dateLabel.text = "03.02(수)"
        $0.lastDayButton.addTarget(self, action: #selector(tapLastDayButton(_:)), for: .touchUpInside)
        $0.nextDayButton.addTarget(self, action: #selector(tapNextDayButton(_:)), for: .touchUpInside)
    }
    
    private let breakfastMenuView = CafeteriaMenuView().then {
        $0.dataSetting(iconName: "Tita-Breakfast", titleName: "아침 식사", menuName: "준비된 아침 급식이 없어요")
    }
    
    private let lunchMenuView = CafeteriaMenuView().then {
        $0.dataSetting(iconName: "TIta-Lunch", titleName: "점심 식사", menuName: "준비된 점심 급식이 없어요")
    }
    
    private let dinnerMenuView = CafeteriaMenuView().then {
        $0.dataSetting(iconName: "Tita-Dinner", titleName: "저녁 식사", menuName: "준비된 저녁 급식이 없어요")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc private func tapPrevious(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
        print("previous")
    }
    
    @objc private func tapLastDayButton(_ sender: UIButton){
        print("last day")
    }
    
    @objc private func tapNextDayButton(_ sender: UIButton){
        print("next day")
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [topView, dateView, breakfastMenuView, lunchMenuView, dinnerMenuView].forEach { view.addSubview($0)}
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/18.45)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(29)
        }
        
        dateView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/8.12)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(27.01)
        }
        
        breakfastMenuView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.21)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(4.27)
        }
        
        lunchMenuView.snp.makeConstraints { make in
            make.width.height.centerX.equalTo(breakfastMenuView)
            make.top.equalTo(breakfastMenuView.snp.bottom).offset(self.view.frame.height/38.67)
        }
        
        dinnerMenuView.snp.makeConstraints { make in
            make.width.height.centerX.equalTo(lunchMenuView)
            make.top.equalTo(lunchMenuView.snp.bottom).offset(self.view.frame.height/38.67)
        }
    
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct CafeteriaViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        CafeteriaViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            CafeteriaViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
