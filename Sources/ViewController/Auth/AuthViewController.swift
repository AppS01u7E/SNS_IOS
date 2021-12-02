import UIKit
import SnapKit
import Then

class AuthViewController: UIViewController {
    
    private let circleImg = UIImageView().then {
        $0.image = .init(named: "AuthCircle")
    }
    
    private let mainImg = UIImageView().then {
        $0.image = .init(named: "AuthImg")
    }
    
    private let welcome = UILabel().then {
        $0.text = "Welcome!!"
        $0.font = .init(name: Font.bold.rawValue, size: 18)
    }
    
    private let loginBtn = UIButton(type: .system).then {
        $0.setTitle("로그인 하기", for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 18)
    }
    
    private let signupBtn = UIButton(type: .system).then {
        $0.setTitle("회원이 아니신가요?", for: .normal)
    }

    private let question = UILabel().then {
        $0.text = "선생님이신가요?"
    }
    
    private let okBtn = UIButton(type: .system).then {
        $0.setTitle("확인", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        loginBtn.layer.cornerRadius = 20
        
        [circleImg, mainImg, welcome, loginBtn, signupBtn, question, okBtn]
            .forEach{view.addSubview($0)}
        
        circleImg.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(220)
        }
        
        mainImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
        }
        
        welcome.snp.makeConstraints {
            $0.top.equalTo(mainImg.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(welcome.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        signupBtn.snp.makeConstraints {
            $0.top.equalTo(loginBtn.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        question.snp.makeConstraints {
            $0.top.equalTo(signupBtn.snp.bottom).offset(40)
            $0.leading.lessThanOrEqualToSuperview().offset(107)
        }
        
        okBtn.snp.makeConstraints {
            $0.centerY.equalTo(question)
            $0.leading.equalTo(question.snp.trailing).offset(23)
        }
    }


}

