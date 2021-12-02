//
//  EmailVerificationViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/11/30.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit

class EmailVerificationViewController: UIViewController {
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let email = AuthView().then {
        $0.txtField.placeholder = "이메일을 입력해주세요."
        $0.view.layer.borderWidth = 0.5
        $0.view.layer.borderColor = UIColor.lightGray.cgColor
        $0.view.layer.cornerRadius = 10
    }
    
    private let emailBtn = UIButton(type: .system).then {
        $0.setTitle("이메일 인증", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 10)
        $0.layer.cornerRadius = 10
    }
    
    private let postEmail = UILabel().then {
        $0.text = "· 아이디 정보를 이메일에 전송했습니다. \n · 이메일이 오지 않았다면 입력하시 이메일이 정확한지 확인해주세요."
        $0.textColor = .lightGray
        $0.font = .init(name: Font.bold.rawValue, size: 10)
        $0.numberOfLines = 2
    }
    
    private let numLabel = UILabel().then {
        $0.text = "인증번호"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let num = AuthView().then {
        $0.view.layer.borderColor = UIColor.lightGray.cgColor
        $0.view.layer.borderWidth = 0.5
        $0.view.layer.cornerRadius = 10
        $0.txtField.placeholder = "인증번호를 입력해주세요."
    }
    
    private let changeBtn = UIButton(type: .system).then {
        $0.setTitle("비밀번호 바꾸기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 15)
        $0.layer.cornerRadius = 15
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        [emailLabel, email, emailBtn, postEmail, numLabel, num, changeBtn]
            .forEach{view.addSubview($0)}
        
        emailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().inset(30)
        }
        
        email.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        emailBtn.snp.makeConstraints {
            $0.top.equalTo(email.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }
        
        postEmail.snp.makeConstraints {
            $0.top.equalTo(emailBtn.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
        }
        
        numLabel.snp.makeConstraints {
            $0.top.equalTo(postEmail.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(30)
        }
        
        num.snp.makeConstraints {
            $0.top.equalTo(numLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        changeBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
    }

}
