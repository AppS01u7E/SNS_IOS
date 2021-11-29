//
//  FinishSignUpViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/11/29.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit

class FinishSignUpViewController: UIViewController {
    
    private let imgView = UIImageView().then {
        $0.image = .init(systemName: "checkmark.circle.fill")
        $0.tintColor = .init(named: Color.btnColor.rawValue)
    }
    
    private let success = UILabel().then {
        $0.text = "회원가입에 성공하였습니다!!"
        $0.font = .init(name: Font.bold.rawValue, size: 18)
    }
    
    private let login = UIButton(type: .system).then {
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("로그인하러 가기", for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        login.layer.cornerRadius = 10
        [imgView, success, login].forEach{view.addSubview($0)}
        
        imgView.snp.makeConstraints {
            $0.height.width.equalTo(150)
            $0.center.equalToSuperview()
        }
        
        success.snp.makeConstraints{
            $0.top.equalTo(imgView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        login.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(140)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
    }
}
