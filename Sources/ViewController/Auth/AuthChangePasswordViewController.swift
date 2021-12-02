//
//  ChangePasswordViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/11/30.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit

class AuthChangePasswordViewController: UIViewController {
    
    private let newPasswordLabel = UILabel().then {
        $0.text = "새 비밀번호"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let newPassword = AuthView().then {
        $0.view.layer.cornerRadius = 5
        $0.view.layer.borderColor = UIColor.lightGray.cgColor
        $0.view.layer.borderWidth = 0.5
        $0.txtField.placeholder = "새 비밀번호를 입력해주세요."
    }
    
    private let checkPasswordLabel = UILabel().then {
        $0.text = "새 비밀번호 재확인"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let checkPassword = AuthView().then {
        $0.view.layer.cornerRadius = 5
        $0.view.layer.borderColor = UIColor.lightGray.cgColor
        $0.view.layer.borderWidth = 0.5
        $0.txtField.placeholder = "새 비밀번호를 다시 입력해주세요."
    }
    
    private let changeBtn = UIButton(type: .system).then {
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("변경", for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 18)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        [newPasswordLabel, newPassword, checkPasswordLabel, checkPassword,  changeBtn].forEach{view.addSubview($0)}
        
        newPasswordLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(30)
        }
        
        newPassword.snp.makeConstraints {
            $0.top.equalTo(newPasswordLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        
        checkPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(newPassword.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(30)
        }
        
        checkPassword.snp.makeConstraints {
            $0.top.equalTo(checkPasswordLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        changeBtn.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        
    }
}
