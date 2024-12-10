//
//  PersonalDetailsViewController.swift
//  VibeVersaProject
//
//  Created by Ayesha Dastagir on 02/12/2024.
//

import UIKit

class PersonalDetailsViewController: UIViewController {

    private let titleLabel = Label(texttitle: "Personal Details", textcolor: .black, font: .boldSystemFont(ofSize: 30.autoSized), numOflines: 1, textalignment: .left)
    private let subtitleLabel = Label(texttitle: "Provide your personal details to enhance your experience and connect with like-minded individuals.", textcolor: .black, font: .systemFont(ofSize: 15.autoSized), numOflines: 0, textalignment: .left)
    private let workLinkLabel = Label(texttitle: "Work Link*", textcolor: .black, font: .systemFont(ofSize: 17.autoSized, weight: .semibold), numOflines: 0, textalignment: .left)
    private lazy var workLinkView: View = {
        let view = View(backgroundcolor: .darkBeige, cornerradius: 20.autoSized)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldAppear))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    private let placeholderLabel = Label(texttitle: "E.x.LinkedIn Profile: [Enter your LinkedIn Profile URL]" ,textcolor: .black, font: .systemFont(ofSize: 15.autoSized), textalignment: .left)
    private let linkTextField: TextField = {
        let tf = TextField(textTitle: "", backgroundcolor: .clear)
        tf.isHidden = true
        tf.isEnabled = false
        tf.layer.borderColor = UIColor.clear.cgColor
        return tf
    }()
    private let descriptionLabel = Label(texttitle: "Description*", textcolor: .black, font: .systemFont(ofSize: 17.autoSized, weight: .semibold), numOflines: 0, textalignment: .left)
    private let descriptionField: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .left
        tv.backgroundColor = .darkBeige
        tv.font = .systemFont(ofSize: 15.autoSized)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.cornerRadius = 10.autoSized
        tv.layer.borderColor = UIColor.black.cgColor
        tv.layer.borderWidth = 1
        tv.textContainerInset = UIEdgeInsets(top: 10.autoSized, left: 8.widthRatio, bottom: 10.autoSized, right: 8.widthRatio)
        return tv
    }()
    private let maxCharacterLabel = Label(texttitle: "/100 words", textcolor: .black, font: .systemFont(ofSize: 15.autoSized))
    private let counterLabel = Label(texttitle: "0", textcolor: .black, font: .systemFont(ofSize: 15.autoSized))
    private let descriptionPHLabel = Label(texttitle: "Enter your description here..." ,textcolor: .black, font: .systemFont(ofSize: 15.autoSized), textalignment: .left)
    private let achievementLabel = Label(texttitle: "Achievement*", textcolor: .black, font: .systemFont(ofSize: 17.autoSized, weight: .semibold), numOflines: 0, textalignment: .left)
    private let achievementField: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .left
        tv.backgroundColor = .darkBeige
        tv.font = .systemFont(ofSize: 15.autoSized)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.cornerRadius = 10.autoSized
        tv.layer.borderColor = UIColor.black.cgColor
        tv.layer.borderWidth = 1
        tv.textContainerInset = UIEdgeInsets(top: 10.autoSized, left: 8.widthRatio, bottom: 10.autoSized, right: 8.widthRatio)
        return tv
    }()
    private let achievementPHLabel = Label(texttitle: "Add your Achievements..." ,textcolor: .black, font: .systemFont(ofSize: 15.autoSized), textalignment: .left)
    private let backButton = ButtonWithImage(imageName: "back")
    private let nextButton = ButtonWithLabel(title: "Next", backgroundColor: .brown, titlecolor: .white, cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .beige
        setupViews()
        descriptionField.delegate = self
        achievementField.delegate = self
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(workLinkLabel)
        view.addSubview(workLinkView)
        workLinkView.addSubview(placeholderLabel)
        workLinkView.addSubview(linkTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionField)
        descriptionField.addSubview(descriptionPHLabel)
        view.addSubview(maxCharacterLabel)
        view.addSubview(counterLabel)
        view.addSubview(achievementLabel)
        view.addSubview(achievementField)
        view.addSubview(achievementPHLabel)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60.autoSized),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.autoSized),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            
            workLinkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            workLinkLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40.autoSized),
            
            workLinkView.topAnchor.constraint(equalTo: workLinkLabel.bottomAnchor, constant: 10.autoSized),
            workLinkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            workLinkView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            workLinkView.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            placeholderLabel.topAnchor.constraint(equalTo: workLinkView.topAnchor, constant: 5.autoSized),
            placeholderLabel.leadingAnchor.constraint(equalTo: workLinkView.leadingAnchor, constant: 10.widthRatio),
            placeholderLabel.trailingAnchor.constraint(equalTo: workLinkView.trailingAnchor, constant: -10.widthRatio),
            
            linkTextField.topAnchor.constraint(equalTo: workLinkView.topAnchor, constant: 2.autoSized),
            linkTextField.leadingAnchor.constraint(equalTo: workLinkView.leadingAnchor),
            linkTextField.trailingAnchor.constraint(equalTo: workLinkView.trailingAnchor),
            linkTextField.bottomAnchor.constraint(equalTo: workLinkView.bottomAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            descriptionLabel.topAnchor.constraint(equalTo: linkTextField.bottomAnchor, constant: 40.autoSized),
            
            descriptionField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10.autoSized),
            descriptionField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            descriptionField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            descriptionField.heightAnchor.constraint(equalToConstant: 110.autoSized),
            
            descriptionPHLabel.leadingAnchor.constraint(equalTo: descriptionField.leadingAnchor, constant: 11.widthRatio),
            descriptionPHLabel.topAnchor.constraint(equalTo: descriptionField.topAnchor, constant: 10.widthRatio),
            
            maxCharacterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            maxCharacterLabel.bottomAnchor.constraint(equalTo: descriptionField.topAnchor, constant: -10.autoSized),
            
            counterLabel.trailingAnchor.constraint(equalTo: maxCharacterLabel.leadingAnchor),
            counterLabel.bottomAnchor.constraint(equalTo: descriptionField.topAnchor, constant: -10.autoSized),
            
            achievementLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            achievementLabel.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 40.autoSized),
            
            achievementField.topAnchor.constraint(equalTo: achievementLabel.bottomAnchor, constant: 10.autoSized),
            achievementField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            achievementField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            achievementField.heightAnchor.constraint(equalToConstant: 110.autoSized),
            
            achievementPHLabel.leadingAnchor.constraint(equalTo: achievementField.leadingAnchor, constant: 11.widthRatio),
            achievementPHLabel.topAnchor.constraint(equalTo: achievementField.topAnchor, constant: 10.widthRatio),
            
            nextButton.topAnchor.constraint(equalTo: achievementField.bottomAnchor, constant: 40.autoSized),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.widthRatio),
            nextButton.widthAnchor.constraint(equalToConstant: 100.widthRatio),
            nextButton.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            backButton.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor),
            backButton.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -16.widthRatio),
        ])
    }
    
    @objc private func textFieldAppear() {
        placeholderLabel.isHidden = true
        linkTextField.isHidden = false
        linkTextField.isEnabled = true
    }
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func nextButtonTapped() {
        // Handle next button actions
        self.navigationController?.pushViewController(UploadPictureViewController(), animated: true)
    }
}

extension PersonalDetailsViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == descriptionField {
            descriptionPHLabel.isHidden = !textView.text.isEmpty
        } else if textView == achievementField {
            achievementPHLabel.isHidden = !textView.text.isEmpty
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == descriptionField {
            let currentText = textView.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
            let trimmedTextWithoutSpaces = updatedText.replacingOccurrences(of: " ", with: "")

            if trimmedTextWithoutSpaces.count > 100 {
                let excessCharacterCount = trimmedTextWithoutSpaces.count - 100
                let newText = updatedText.prefix(updatedText.count - excessCharacterCount)
                textView.text = String(newText)
              
                if trimmedTextWithoutSpaces.count > 100 {
                    counterLabel.text = "100"
                } else if trimmedTextWithoutSpaces.count <= 100 {
                    counterLabel.text = "\(trimmedTextWithoutSpaces.count)"
                }
                descriptionPHLabel.isHidden = !newText.isEmpty
                return false
            }
            counterLabel.text = "\(trimmedTextWithoutSpaces.count)"
            descriptionPHLabel.isHidden = !updatedText.isEmpty
            return true
        }
        return true
    }
}




