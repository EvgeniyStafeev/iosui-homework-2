//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Стафеев Евгений on 01.11.2022.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    
    lazy var profileAvatarImage: UIImageView = {
        let tempImage = UIImage(named: "5631")
        let profileAvatarImage = UIImageView()
        profileAvatarImage.translatesAutoresizingMaskIntoConstraints = false
        profileAvatarImage.clipsToBounds = true
        profileAvatarImage.backgroundColor = .systemBackground
        profileAvatarImage.layer.cornerRadius = 55.0
        profileAvatarImage.layer.borderWidth = 3.0
        profileAvatarImage.layer.borderColor = UIColor.white.cgColor
        profileAvatarImage.image = tempImage
        return profileAvatarImage
    }()
    
    lazy var profileNameLabel: UILabel = {
        let profileNameLabel = UILabel()
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.text = "Hipster Cat"
        profileNameLabel.textColor = .black
        profileNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return profileNameLabel
    }()
    
    lazy var profileStatusTextField: UILabel = {
        let profileStatusTextField = UILabel()
        profileStatusTextField.translatesAutoresizingMaskIntoConstraints = false
        profileStatusTextField.text = "Waiting for something..."
        profileStatusTextField.textColor = .gray
        profileStatusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        profileStatusTextField.isUserInteractionEnabled = false
        return profileStatusTextField
    }()
    
    lazy var showStatusButton: UIButton = {
            let showStatusButton = UIButton()
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.setTitleColor(UIColor.white, for: .normal)
        showStatusButton.layer.cornerRadius = 12.0
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4.0
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            return showStatusButton
        }()
    
    lazy var newStatus: UITextField = {
        let newStatus = UITextField()
        newStatus.translatesAutoresizingMaskIntoConstraints = false
        newStatus.indent(size: 10)
        newStatus.placeholder = "Enter text here ..."
        newStatus.textColor = .black
        newStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        newStatus.backgroundColor = .white
        newStatus.layer.borderWidth = 1.0
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.layer.cornerRadius = 12.0
        newStatus.addTarget(self, action: #selector(statusTextChanges), for: .editingChanged)
            return newStatus
         }()
        
    override init(frame: CGRect) {
             super.init(frame: frame)
             setupLayout()
         }

         required init?(coder: NSCoder) {
             super.init(coder: coder)
         }
    
    private var statusText = String()
    
    @objc private func buttonPressed() {
        profileStatusTextField.text = statusText
        self.endEditing(true)
        print(statusText)
    }
    
    @objc private func statusTextChanges() {
        statusText = newStatus.text ?? "No text"
            print(newStatus)
        }
    
    private func setupLayout() {
        [profileAvatarImage, profileNameLabel, profileStatusTextField, showStatusButton, newStatus].forEach { addSubview($0) }
        
        profileAvatarImage.snp.makeConstraints{ (make) in
            make.height.width.equalTo(110.0)
            make.leading.top.equalTo(16.0)
        }
        profileNameLabel.snp.makeConstraints{ (make) in
            make.leading.equalTo(profileAvatarImage).inset(126.0)
            make.top.equalToSuperview().inset(27.0)
            make.trailing.equalToSuperview().inset(-16.0)
        }
        
        profileStatusTextField.snp.makeConstraints{ (make) in
            make.leading.equalTo(profileAvatarImage).inset(126.0)
            make.bottom.equalTo(showStatusButton).inset(108.0)
            make.trailing.equalTo(-16.0)
        }
        
        newStatus.snp.makeConstraints{ (make) in
            make.leading.equalTo(profileAvatarImage).inset(126.0)
            make.trailing.equalTo(-16.0)
            make.top.equalTo(110)
            make.height.equalTo(40)
        }
    
        showStatusButton.snp.makeConstraints{ (make) in
            make.leading.equalTo(16.0)
            make.top.equalTo(160.0)
            make.trailing.equalTo(-16.0)
            make.height.equalTo(50.0)
        }
    }
}
