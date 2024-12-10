//
//  UploadPictureViewController.swift
//  VibeVersaProject
//
//  Created by Ayesha Dastagir on 03/12/2024.
//

import UIKit

class UploadPictureViewController: UIViewController {
    
    private let titleLabel = Label(texttitle: "Upload Your Pictures", textcolor: .black, font: .boldSystemFont(ofSize: 30.autoSized), numOflines: 1, textalignment: .left)
    private let subtitleLabel = Label(texttitle: "Personalize your account with profile picture upload", textcolor: .black, font: .systemFont(ofSize: 15.autoSized), numOflines: 0, textalignment: .left)
    private let uploadPicView = View(backgroundcolor: .pastelBeige, cornerradius: 30.autoSized)
    private let galleryUploadPicView = View(backgroundcolor: .customBrown, cornerradius: 25.autoSized)
    private let galleryUploadDashedPicView = View(backgroundcolor: .clear, cornerradius: 25.autoSized)
    private let cameraUploadPicView = View(backgroundcolor: .customBrown, cornerradius: 20.autoSized)
    private let cameraUploadDashedView = View(backgroundcolor: .clear, cornerradius: 20.autoSized)
    private let uploadGalleryButton = ButtonWithImage(imageName: "upload", backgroundColor: .clear, cornerRadius: 0)
    private let uploadCameraButton = ButtonWithImage(imageName: "camera", backgroundColor: .white, cornerRadius: Int(10.autoSized))
    private let warningIcon = ImageView(imagetitle: "warning")
    private let warningLabel = Label(texttitle: "Please either choose a picture to upload or use the camera to click a pic", textcolor: .black, font: .systemFont(ofSize: 15.autoSized))
    private let doneButton = ButtonWithImage(imageName: "back")
    private let nextButton = ButtonWithLabel(title: "Done", backgroundColor: .brown, titlecolor: .white, cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .beige
        setupViews()
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async {
            self.cameraUploadDashedView.addDashedBorder()
            self.galleryUploadDashedPicView.addDashedBorder()
            self.uploadPicView.addBottomShadow()
            self.galleryUploadPicView.addBottomShadow()
            self.cameraUploadPicView.addBottomShadow()
        }
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(uploadPicView)
        uploadPicView.addSubview(galleryUploadPicView)
        galleryUploadPicView.addSubview(galleryUploadDashedPicView)
        galleryUploadDashedPicView.addSubview(uploadGalleryButton)
        uploadPicView.addSubview(cameraUploadPicView)
        uploadPicView.addSubview(cameraUploadDashedView)
        cameraUploadDashedView.addSubview(uploadCameraButton)
        view.addSubview(warningIcon)
        view.addSubview(warningLabel)
        view.addSubview(nextButton)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60.autoSized),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.autoSized),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            
            uploadPicView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50.autoSized),
            uploadPicView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            uploadPicView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            uploadPicView.heightAnchor.constraint(equalToConstant: 400.autoSized),
            
            galleryUploadPicView.topAnchor.constraint(equalTo: uploadPicView.topAnchor, constant: 25.autoSized),
            galleryUploadPicView.leadingAnchor.constraint(equalTo: uploadPicView.leadingAnchor, constant: 20.widthRatio),
            galleryUploadPicView.trailingAnchor.constraint(equalTo: uploadPicView.trailingAnchor, constant: -20.widthRatio),
            galleryUploadPicView.heightAnchor.constraint(equalToConstant: 220.autoSized),
            
            galleryUploadDashedPicView.topAnchor.constraint(equalTo: galleryUploadPicView.topAnchor, constant: 15.autoSized),
            galleryUploadDashedPicView.leadingAnchor.constraint(equalTo: galleryUploadPicView.leadingAnchor, constant: 15.widthRatio),
            galleryUploadDashedPicView.trailingAnchor.constraint(equalTo: galleryUploadPicView.trailingAnchor, constant: -15.widthRatio),
            galleryUploadDashedPicView.bottomAnchor.constraint(equalTo: galleryUploadPicView.bottomAnchor, constant: -15.autoSized),
            
            uploadGalleryButton.topAnchor.constraint(equalTo: galleryUploadDashedPicView.topAnchor),
            uploadGalleryButton.centerXAnchor.constraint(equalTo: galleryUploadPicView.centerXAnchor),
            uploadGalleryButton.bottomAnchor.constraint(equalTo: galleryUploadDashedPicView.bottomAnchor),
            
            cameraUploadPicView.topAnchor.constraint(equalTo: galleryUploadPicView.bottomAnchor, constant: 25.autoSized),
            cameraUploadPicView.leadingAnchor.constraint(equalTo: uploadPicView.leadingAnchor, constant: 20.widthRatio),
            cameraUploadPicView.trailingAnchor.constraint(equalTo: uploadPicView.trailingAnchor, constant: -20.widthRatio),
            cameraUploadPicView.bottomAnchor.constraint(equalTo: uploadPicView.bottomAnchor, constant: -25.autoSized),
            
            cameraUploadDashedView.topAnchor.constraint(equalTo: cameraUploadPicView.topAnchor, constant: 15.autoSized),
            cameraUploadDashedView.leadingAnchor.constraint(equalTo: cameraUploadPicView.leadingAnchor, constant: 15.widthRatio),
            cameraUploadDashedView.trailingAnchor.constraint(equalTo: cameraUploadPicView.trailingAnchor, constant: -15.widthRatio),
            cameraUploadDashedView.bottomAnchor.constraint(equalTo: cameraUploadPicView.bottomAnchor, constant: -15.autoSized),
            
            uploadCameraButton.widthAnchor.constraint(equalToConstant: 50.widthRatio),
            uploadCameraButton.heightAnchor.constraint(equalToConstant: 50.autoSized),
            uploadCameraButton.centerYAnchor.constraint(equalTo: cameraUploadDashedView.centerYAnchor),
            uploadCameraButton.centerXAnchor.constraint(equalTo: cameraUploadDashedView.centerXAnchor),
            
            warningIcon.topAnchor.constraint(equalTo: uploadPicView.bottomAnchor, constant: 20.autoSized),
            warningIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            warningIcon.widthAnchor.constraint(equalToConstant: 40.widthRatio),
            warningIcon.heightAnchor.constraint(equalToConstant: 40.autoSized),
            
            warningLabel.topAnchor.constraint(equalTo: warningIcon.bottomAnchor, constant: 5.autoSized),
            warningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            warningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            warningLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            
            nextButton.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 40.autoSized),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.widthRatio),
            nextButton.widthAnchor.constraint(equalToConstant: 100.widthRatio),
            nextButton.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            doneButton.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor),
            doneButton.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -25.widthRatio),
        ])
    }
    
    @objc private func doneButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func nextButtonTapped() {
        // Handle next button actions
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
