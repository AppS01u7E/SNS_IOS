//
//  SignInViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/11/29.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    private let login = UILabel().then {
        $0.text = "Login"
        $0.font = .init(name: Font.regular.rawValue, size: 35)
        $0.textColor = .init(named: Color.btnColor.rawValue)
    }
    
    private let loginImg = UIImageView().then {
        $0.image = .init(named: "SignInImg")
    }
    
    private let email = AuthView().then {
        $0.txtField.placeholder = "Email 및 아이디"
        $0.eyesBtn.isHidden = true
    }
    
    private let lostId = UIButton(type: .system).then {
        $0.setTitle("아이디를 잃어버리셨나요?", for: .normal)
        $0.setTitleColor(.init(named: Color.btnColor.rawValue), for: .normal)
    }
    
    private let password = AuthView().then {
        $0.txtField.placeholder = "비밀번호"
    }
    
    private let lostPw = UIButton(type: .system).then {
        $0.setTitle("비밀번호를 잃어버리셨나요?", for: .normal)
        $0.setTitleColor(.init(named: Color.btnColor.rawValue), for: .normal)
    }
    
    private let signinBtn = UIButton(type: .system).then {
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("로그인", for: .normal)
    }
    
    private let question = UILabel().then {
        $0.text = "계정이 없으신가요?"
    }
    
    private let signupBtn = UIButton(type: .system).then {
        $0.setTitle("회원가입 하러가기", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setup() {
        signinBtn.layer.cornerRadius = 20
        email.view.addShadow(location: .bottom)
        password.view.addShadow(location: .bottom)
        
        [login, loginImg, email, lostId, password, lostPw, signinBtn, question, signupBtn]
            .forEach{view.addSubview($0)}
        
        login.snp.makeConstraints {
            $0.top.equalTo(additionalSafeAreaInsets.top).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        loginImg.snp.makeConstraints {
            $0.top.equalTo(login.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(268)
            $0.height.equalTo(187)
        }
        
        email.snp.makeConstraints {
            $0.top.equalTo(loginImg.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        lostId.snp.makeConstraints {
            $0.top.equalTo(email.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(47)
        }
        
        password.snp.makeConstraints {
            $0.top.equalTo(lostId.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        lostPw.snp.makeConstraints {
            $0.top.equalTo(password.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(47)
        }
        
        signinBtn.snp.makeConstraints {
            $0.top.equalTo(lostPw.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        question.snp.makeConstraints {
            $0.top.equalTo(signinBtn.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(64)
        }
        
        signupBtn.snp.makeConstraints {
            $0.centerY.equalTo(question)
            $0.leading.equalTo(question.snp.trailing).offset(40)
        }
    }
}
