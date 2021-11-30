//
//  FindEmailViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/11/30.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit

class FindIdViewController: UIViewController {
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let email = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.view.layer.cornerRadius = 10
        $0.view.layer.borderWidth = 0.5
        $0.view.layer.borderColor = UIColor.gray.cgColor
        $0.txtField.placeholder = "이메일을 입력해주세요"
    }
    
    private let findId = UIButton(type: .system).then {
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("아이디 찾기", for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 13)
    }
    
    private let postEmail = UILabel().then {
        $0.text = "· 아이디 정보를 이메일에 전송했습니다. \n · 이메일이 오지 않았다면 입력하시 이메일이 정확한지 확인해주세요."
        $0.textColor = .lightGray
        $0.font = .init(name: Font.bold.rawValue, size: 7)
        $0.numberOfLines = 2
    }
    
    private let loginBtn = UIButton(type: .system).then {
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("아이디 찾기", for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 15)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        
        findId.layer.cornerRadius = 10
        loginBtn.layer.cornerRadius  = 15
        
        [emailLabel, email, findId, postEmail, loginBtn].forEach{view.addSubview($0)}
        
        emailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(30)
        }
        
        email.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(35)
        }
        
        findId.snp.makeConstraints {
            $0.top.equalTo(email.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }
        
        postEmail.snp.makeConstraints {
            $0.top.equalTo(findId.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(30)
        }
        
        loginBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }

}
