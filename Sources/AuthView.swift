//
//  AuthView.swift
//  SNS
//
//  Created by 김기영 on 2021/11/29.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class AuthView: UIView {
    
    private let disposebag = DisposeBag()
    private var click = true
    
    let view = UIView().then {
        $0.backgroundColor = .white
    }
    
    let eyesBtn = UIButton().then {
        $0.setImage(.init(systemName: "eye"), for: .normal)
        $0.tintColor = .gray
    }
    
    let txtField = UITextField().then {
        $0.font = .init(name: Font.regular.rawValue, size: 15)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        eyesBtn.rx.tap.subscribe {[unowned self] _ in
            if self.click {
                self.eyesBtn.setImage(.init(systemName: "eye.slash"), for: .normal)
                self.click.toggle()
                self.txtField.isSecureTextEntry = true
            }
            else {
                self.eyesBtn.setImage(.init(systemName: "eye"), for: .normal)
                self.click.toggle()
                self.txtField.isSecureTextEntry = false
            }
        }.disposed(by: disposebag)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        view.layer.cornerRadius = 20
        
        self.addSubview(view)
        self.addSubview(txtField)
        self.addSubview(eyesBtn)
        
        view.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        txtField.snp.makeConstraints {
            $0.centerY.equalTo(view)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        eyesBtn.snp.makeConstraints {
            $0.centerY.equalTo(txtField)
            $0.trailing.equalTo(txtField.snp.trailing).inset(5)
            $0.width.height.equalTo(20)
        }
    }
}
