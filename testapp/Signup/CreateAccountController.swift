//
//  CreateAccountViewController.swift
//  VibeVersaProject
//
//  Created by Ali on 01/12/2024.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class CreateAccountController: UIViewController {

    private let backButton = ButtonWithImage(imageName: "back")
    private let titleLabel = Label(texttitle: "Create account", textcolor: .black, font: .boldSystemFont(ofSize: 30), numOflines: 1, textalignment: .left)
    private let subtitleLabel = Label(texttitle: "Create an account and enjoy a world of learning and connections.", textcolor: .black, font: .systemFont(ofSize: 15), numOflines: 0, textalignment: .left)
    private let firstNameField = TextField(textTitle: "First Name", backgroundcolor: .clear)
    private let lastNameField = TextField(textTitle: "Last Name", backgroundcolor: .clear)
    private let phoneField = TextField(textTitle: "Phone", backgroundcolor: .clear)
    private let emailField = TextField(textTitle: "Email", backgroundcolor: .clear)
    private let passwordField = TextField(textTitle: "Password", backgroundcolor: .clear)
    private let continueButton = ButtonWithLabel(title: "Continue", backgroundColor: .brown, titlecolor: .white, cornerRadius: 10)
    private let loginLabel = Label(texttitle: "Already have an account?", textcolor: .brown, font: .systemFont(ofSize: 16), numOflines: 1, textalignment: .center)
    private let loginButtonLabel = Label(texttitle: "Login", textcolor: .black, font: .systemFont(ofSize: 16), numOflines: 0, textalignment: .left)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .beige
        setupViews()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    private func setupViews() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(firstNameField)
        view.addSubview(lastNameField)
        view.addSubview(phoneField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(continueButton)
        view.addSubview(loginLabel)
        view.addSubview(loginButtonLabel)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.autoSized),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.widthRatio),

            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40.autoSized),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.autoSized),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),

            firstNameField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20.autoSized),
            firstNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            firstNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            firstNameField.heightAnchor.constraint(equalToConstant: 50.autoSized),

            lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 20.autoSized),
            lastNameField.leadingAnchor.constraint(equalTo: firstNameField.leadingAnchor),
            lastNameField.trailingAnchor.constraint(equalTo: firstNameField.trailingAnchor),
            lastNameField.heightAnchor.constraint(equalTo: firstNameField.heightAnchor),

            phoneField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 20.autoSized),
            phoneField.leadingAnchor.constraint(equalTo: firstNameField.leadingAnchor),
            phoneField.trailingAnchor.constraint(equalTo: firstNameField.trailingAnchor),
            phoneField.heightAnchor.constraint(equalTo: firstNameField.heightAnchor),

            emailField.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 20.autoSized),
            emailField.leadingAnchor.constraint(equalTo: firstNameField.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: firstNameField.trailingAnchor),
            emailField.heightAnchor.constraint(equalTo: firstNameField.heightAnchor),

            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20.autoSized),
            passwordField.leadingAnchor.constraint(equalTo: firstNameField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: firstNameField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalTo: firstNameField.heightAnchor),

            continueButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40.autoSized),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.widthRatio),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.widthRatio),
            continueButton.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            loginLabel.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 20.autoSized),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20.widthRatio),
            
            loginButtonLabel.leadingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            loginButtonLabel.topAnchor.constraint(equalTo: loginLabel.topAnchor),
        ])
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func continueButtonTapped() {
        guard let firstName = firstNameField.text, !firstName.isEmpty,
              let lastName = lastNameField.text, !lastName.isEmpty,
              let phone = phoneField.text, !phone.isEmpty,
              let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            // Show an error message if any field is empty
            showError(message: "Please fill in all fields.")
            return
        }
        
        // Firebase Authentication - Create user with email and password
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Handle error
                self.showError(message: error.localizedDescription)
                return
            }
            
            // User successfully created, now store additional details in Firestore
            let userId = authResult?.user.uid
            let db = Firestore.firestore()
            
            let userData: [String: Any] = [
                "firstName": firstName,
                "lastName": lastName,
                "phone": phone,
                "email": email
            ]
            
            db.collection("users").document(userId!).setData(userData) { error in
                if let error = error {
                    // Handle Firestore error
                    self.showError(message: error.localizedDescription)
                } else {
                    // Successfully saved user data to Firestore
                    self.navigationController?.pushViewController(AddDobController(), animated: true)
                }
            }
        }
    }

    private func showError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    
}
