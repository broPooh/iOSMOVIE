//
//  SignUpViewController.swift
//  SSACMOVIE
//
//  Created by 윤형식 on 2022/04/28.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextFiled: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var addSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBtn()
    
    }
    
    func initBtn() {
        signUpBtn.backgroundColor = UIColor.white
        signUpBtn.setTitle("회원가입", for: .normal)
        signUpBtn.setTitleColor(UIColor.black, for: .normal)
        signUpBtn.setTitleColor(UIColor.blue, for: .highlighted)
    }
    
    func initSwitch() {
        addSwitch.onTintColor = UIColor.magenta
        addSwitch.thumbTintColor = UIColor.yellow
    }

    @IBAction func signUpBtnClicked(_ sender: Any) {
        
        if checkSignUp() {
            
            let nickName = nickNameTextField.text != nil ? nickNameTextField.text! : "고래밥"
            let location = locationTextField.text != nil ? locationTextField.text! : "서울"
            
            showToast(message: "회원가입 정보 확인\nID : \(emailTextFiled.text!)\nPW : \(passwordTextField.text!)\nNICK : \(nickName)\nLOCATION : \(location)\nCODE : \(codeTextField.text)")
        } else {
            showToast(message: "닉네임과 패스워드는 필수입니다.!")
        }
    }
    
    func checkSignUp() -> Bool {
        if(emailTextFiled.text != nil && passwordTextField.text != nil && passwordTextField.text!.count > 5) {
            return true
        } else {
            return false
        }
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch){
        
        if addSwitch.isOn {
            nickNameTextField.isHidden = false
            locationTextField.isHidden = false
            codeTextField.isHidden = false
        } else {
            nickNameTextField.isHidden = true
            locationTextField.isHidden = true
            codeTextField.isHidden = true
        }
    }
    
    @IBAction func tapClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview() }) }
}
