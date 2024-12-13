//
//  LoginViewController.swift
//  VibeVersaProject
//
//  Created by Ayesha Dastagir on 04/12/2024.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let backButton = ButtonWithImage(imageName: "back")
    private let titleLabel = Label(texttitle: "Hi, Welcome Back!", textcolor: .black, font: .boldSystemFont(ofSize: 30), numOflines: 1, textalignment: .left)
    private let wavingImage = ImageView(imagetitle: "waving")
    private let subtitleLabel = Label(texttitle: "Hello again, You have been missed!", textcolor: .black, font: .systemFont(ofSize: 15), numOflines: 0, textalignment: .left)
    private let emailLabel = Label(texttitle: "Email", textcolor: .black, font: .systemFont(ofSize: 17.autoSized, weight: .semibold), numOflines: 0, textalignment: .left)
    private let emailField = TextField(textTitle: "Email address", backgroundcolor: .clear)
    private let passwordLabel = Label(texttitle: "Password", textcolor: .black, font: .systemFont(ofSize: 17.autoSized, weight: .semibold), numOflines: 0, textalignment: .left)
    private lazy var passwordTextField: TextField = {
        let tf = TextField(textTitle: "Password", backgroundcolor: .clear)
        tf.layer.cornerRadius = 8.autoSized
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = .none
        return tf
    }()
    private lazy var eyeButton: ButtonWithImage = {
        let btn = ButtonWithImage()
        btn.setImage(UIImage(systemName: "eye.slash"), for:.normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return btn
    }()
    private let loginButton = ButtonWithLabel(title: "LOGIN", backgroundColor: .brown, titlecolor: .white, cornerRadius: 10)
    private let orLabelImage = ImageView(imagetitle: "orImage")
    private let googleButton = ButtonWithImage(imageName: "googleLogo")
    private let facebookButton = ButtonWithImage(imageName: "facebook")
    private let appleButton = ButtonWithImage(imageName: "appleLogo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .beige
        setupViews()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(wavingImage)
        view.addSubview(subtitleLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(eyeButton)
        view.addSubview(loginButton)
        view.addSubview(orLabelImage)
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        view.addSubview(appleButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.autoSized),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.widthRatio),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 35.autoSized),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            
            wavingImage.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 35.autoSized),
            wavingImage.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10.widthRatio),
            wavingImage.heightAnchor.constraint(equalToConstant: 30.autoSized),
            wavingImage.widthAnchor.constraint(equalToConstant: 30.widthRatio),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.autoSized),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27.widthRatio),
            emailLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40.autoSized),
            
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20.autoSized),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            emailField.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27.widthRatio),
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 25.autoSized),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20.autoSized),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            eyeButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25.autoSized),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            loginButton.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            orLabelImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5.widthRatio),
            orLabelImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5.widthRatio),
            orLabelImage.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10.autoSized),
            orLabelImage.heightAnchor.constraint(equalToConstant: 45.autoSized),
            
            facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            facebookButton.heightAnchor.constraint(equalToConstant: 50.autoSized),
            facebookButton.widthAnchor.constraint(equalToConstant: 50.widthRatio),
            facebookButton.topAnchor.constraint(equalTo: orLabelImage.bottomAnchor, constant: 20.autoSized),
            
            googleButton.trailingAnchor.constraint(equalTo: facebookButton.leadingAnchor, constant: -20.autoSized),
            googleButton.heightAnchor.constraint(equalToConstant: 40.autoSized),
            googleButton.widthAnchor.constraint(equalToConstant: 40.widthRatio),
            googleButton.topAnchor.constraint(equalTo: orLabelImage.bottomAnchor, constant: 25.autoSized),
            
            appleButton.leadingAnchor.constraint(equalTo: facebookButton.trailingAnchor, constant: 20.autoSized),
            appleButton.heightAnchor.constraint(equalToConstant: 45.autoSized),
            appleButton.widthAnchor.constraint(equalToConstant: 45.widthRatio),
            appleButton.topAnchor.constraint(equalTo: orLabelImage.bottomAnchor, constant: 20.autoSized),

        ])
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func loginButtonTapped() {
        // Validate email and password fields
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showError(message: "Please enter both email and password.")
            return
        }
        
        // Firebase Authentication - Sign in user with email and password
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                // Show error message if sign-in fails
                self.showError(message: error.localizedDescription)
                return
            }
            
            // Successful login - Navigate to HomeViewController
            let homeViewController = HomeViewController()
            homeViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }

    
    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let eyeIcon = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        eyeButton.setImage(UIImage(systemName: eyeIcon), for: .normal)
    }
 
}
