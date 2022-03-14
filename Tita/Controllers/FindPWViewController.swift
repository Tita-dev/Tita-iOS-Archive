//
//  FindPWViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/14.
//

import UIKit
import SnapKit
import Then

class FindPWViewController: UIViewController {
    //MARK: - Properties

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
        [].forEach { view.addSubview($0) }
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct FindPWViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        FindPWViewController()
    }
}
@available(iOS 13.0, *)
struct FindPWViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            FindPWViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
