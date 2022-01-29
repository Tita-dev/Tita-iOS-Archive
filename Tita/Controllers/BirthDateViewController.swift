//
//  BirthDateViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/01/28.
//

import UIKit
import SnapKit
import Then

class BirthDateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "당신의 생일은 언제인가요?", additionalDescription: "생일은 공개되지 않아요!")
    }
    
    private let datePickerView = UIPickerView()
    
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
        [descriptionView, datePickerView].forEach{view.addSubview($0)}
    }
    
    // MARK: - PickerViewSetting
    private func pickerViewSetting(){
        datePickerView.dataSource = self
        datePickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return 0
    }
    
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.98)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
            make.centerX.equalToSuperview()
        }
        
        datePickerView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(6.01)
            make.center.equalToSuperview()
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct BirthDateViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        BirthDateViewController()
    }
}
@available(iOS 13.0, *)
struct BirthDateViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            BirthDateViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
