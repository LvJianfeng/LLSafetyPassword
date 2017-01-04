//
//  LLSafetyPasswordView.swift
//  LLSafetyPassword
//
//  Created by LvJianfeng on 2017/1/4.
//  Copyright © 2017年 LvJianfeng. All rights reserved.
//

import UIKit

class LLSafetyPasswordView: UIView, UITextFieldDelegate {

    // 密码位数
    let passwordCount: Int = 6
    // 设置方块格高
    let passwordHeight: CGFloat = 49
    // 密码圆点大小
    let roundHW = 10
    // Leading
    let leading: CGFloat = 15.0
    // Top
    let top: CGFloat = 60.0
    
    lazy var textField: UITextField = {
        let ptextField = UITextField.init()
        ptextField.textColor = UIColor.clear
        ptextField.tintColor = UIColor.clear
        ptextField.autocapitalizationType = .none
        ptextField.keyboardType = .numberPad
        ptextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        ptextField.layer.borderWidth = 1.0 / UIScreen.main.scale
        ptextField.delegate = self
        ptextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return ptextField
    }()
    
    var dotArray: Array<UIView> = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        // Setup TextField
        setupTextField()
        // Config TextField
        configTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Setup
    func setupTextField() {
        addSubview(textField)
        // 密码需要宽度
        let textFieldWidth = UIScreen.main.bounds.width-leading*2
        textField.frame = CGRect.init(x: leading, y: top, width: textFieldWidth, height: passwordHeight)
    }
    
    // Config
    func configTextField() {
        let textFieldWidth = UIScreen.main.bounds.width-leading*2
        let width = Int(textFieldWidth) / passwordCount
        // 分割线
        for i in 0..<passwordCount-1 {
            let line = UIView.init(frame: CGRect.init(x: CGFloat(Int(leading)+(i+1)*width), y: top, width: 1.0 / UIScreen.main.scale, height: passwordHeight))
            line.backgroundColor = UIColor.groupTableViewBackground
            addSubview(line)
        }
        
        // 点
        for i in 0..<passwordCount {
            let dot = UIView.init(frame: CGRect.init(x: CGFloat(Int(leading)+(width-passwordCount)/2+i*width), y: top+CGFloat((Int(passwordHeight)-roundHW)/2), width: CGFloat(roundHW), height: CGFloat(roundHW)))
            dot.backgroundColor = UIColor.black
            dot.layer.cornerRadius = CGFloat(roundHW/2)
            dot.clipsToBounds = true
            dot.isHidden = true
            addSubview(dot)
            
            dotArray.append(dot)
        }
    }
    
    // UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.resignFirstResponder()
            return false
        }else if string.characters.count == 0 {
            return true
        }else if (textField.text?.characters.count)! >= passwordCount {
            return false
        }else{
            return true
        }
    }
    
    func textFieldDidChange() {
        for dot in dotArray {
            dot.isHidden = true
        }
        
        for i in 0..<(textField.text?.characters.count)! {
            dotArray[i].isHidden = false
        }
        
        if (textField.text?.characters.count)! == passwordCount {
            print("输入成功")
        }
    }
}
