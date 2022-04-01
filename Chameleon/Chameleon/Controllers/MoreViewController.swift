//
//  ViewController.swift
//  Chameleon
//
//  Created by 유정주 on 2022/03/15.
//

import UIKit

class MoreViewController: UIViewController {

    //MARK: - Views
    private var logoutButton: UIButton!
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupMoreUI()
        
        logoutButton.addTarget(self, action: #selector(clickedLogoutButton(sender:)), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc private func clickedLogoutButton(sender: UIButton) {
        print("Remove Auth!!")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
        UserDefaults.standard.synchronize()
        
        self.dismiss(animated: true, completion: nil)
    }

    //MARK: - Methods
    private func setupMoreUI() {
        view.backgroundColor = .backgroundColor
        
        setupLogoutButton()
    }
    
    private func setupLogoutButton() {
        logoutButton = UIButton(type: .system)
        
        logoutButton.setTitle("로그아웃", for: .normal)
        
        view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
            make.centerX.equalToSuperview()
        }
    }
    
    
}

