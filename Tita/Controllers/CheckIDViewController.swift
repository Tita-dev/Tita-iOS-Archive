//
//  CheckIDViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/14.
//


import UIKit
import SnapKit
import Then

class CheckIDViewController: UIViewController {
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
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        
    }
    
    // MARK: - Location
    private func location(){

    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct CheckIDViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        CheckIDViewController()
    }
}
@available(iOS 13.0, *)
struct CheckIDViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            CheckIDViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
