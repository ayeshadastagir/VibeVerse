//
//  InterestsSelectionController.swift
//  VibeVersaProject
//
//  Created by Ali on 01/12/2024.
//
import UIKit

class InterestsSelectionController: UIViewController {

    private let backButton = ButtonWithImage(imageName: "back")
    private let titleLabel = Label(texttitle: "Skill Details", textcolor: .black, font: .boldSystemFont(ofSize: 30), numOflines: 1, textalignment: .left)
    private let subtitleLabel = Label(texttitle: "Tell us more about yourself to get personalized recommendations.", textcolor: .black, font: .systemFont(ofSize: 15), numOflines: 0, textalignment: .left)
    
    private let helpLabel = Label(texttitle: "Things you need help with*", textcolor: .black, font: .systemFont(ofSize: 17, weight: .semibold), numOflines: 0, textalignment: .left)
   
    private let helpDropdown = DropdownField(options: [
        "Music", "Dance", "Painting", "Photography", "Poetry", "Graphic Design",
        "Film Making", "Acting", "Public Speaking", "Story Telling",
        "Programming", "Sports", "Cooking"
    ])
    
    private let goodAtLabel = Label(texttitle: "Things you are good at*", textcolor: .black, font: .systemFont(ofSize: 17, weight: .semibold), numOflines: 0, textalignment: .left)
     
    private let goodAtDropdown = DropdownField(options: [
        "Music", "Dance", "Painting", "Photography", "Poetry", "Graphic Design",
        "Film Making", "Acting", "Public Speaking", "Story Telling",
        "Programming", "Sports", "Cooking"
    ])
    
    private let experienceLabel = Label(texttitle: "Experience*", textcolor: .black, font: .systemFont(ofSize: 17, weight: .semibold), numOflines: 0, textalignment: .left)
    
    private let experienceLabelView: View = {
        let view = View(backgroundcolor: .darkBeige, cornerradius: 20.autoSized)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    private lazy var subtractButton: ButtonWithImage = {
        let btn = ButtonWithImage(imageName: "minus")
        btn.alpha = 0.5
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(subtractButtonTapped), for: .touchUpInside)
        return btn
    }()
    private lazy var addButton: ButtonWithImage = {
        let btn = ButtonWithImage(imageName: "plus")
        btn.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return btn
    }()
    private let experienceValueLabel = Label(texttitle: "0", textcolor: .black, font: .systemFont(ofSize: 25, weight: .regular), numOflines: 0, textalignment: .center)
    private var experienceValue: Int = 0 {
        didSet {
            experienceValueLabel.text = "\(experienceValue)"
            updateSubtractButtonState()
        }
    }
    private let locationLabel = Label(texttitle: "Location*", textcolor: .black, font: .systemFont(ofSize: 17, weight: .semibold), numOflines: 0, textalignment: .left)
    private let locationView: View = {
        let view = View(backgroundcolor: .darkBeige, cornerradius: 20.autoSized)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    private lazy var locationButton: ButtonWithImage = {
        let btn = ButtonWithImage(imageName: "location")
        return btn
    }()

//    private let locationField = TextField(textTitle: "Location", backgroundcolor: .clear)
//    private let gpsButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
//        button.tintColor = .brown
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private let nextButton = ButtonWithLabel(title: "Next", backgroundColor: .brown, titlecolor: .white, cornerRadius: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .beige
        setupViews()
    }
        
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(helpLabel)
        view.addSubview(helpDropdown)
        view.addSubview(goodAtLabel)
        view.addSubview(goodAtDropdown)
        view.addSubview(experienceLabel)
        view.addSubview(experienceLabelView)
        experienceLabelView.addSubview(subtractButton)
        experienceLabelView.addSubview(addButton)
        experienceLabelView.addSubview(experienceValueLabel)
        view.addSubview(locationLabel)
        view.addSubview(locationView)
        locationView.addSubview(locationButton)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60.autoSized),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.autoSized),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            
            helpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            helpLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40.autoSized),

            helpDropdown.topAnchor.constraint(equalTo: helpLabel.bottomAnchor, constant: 10.autoSized),
            helpDropdown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            helpDropdown.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            helpDropdown.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            goodAtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            goodAtLabel.topAnchor.constraint(equalTo: helpDropdown.bottomAnchor, constant: 20.autoSized),
            
            goodAtDropdown.topAnchor.constraint(equalTo: goodAtLabel.bottomAnchor, constant: 10.autoSized),
            goodAtDropdown.leadingAnchor.constraint(equalTo: helpDropdown.leadingAnchor),
            goodAtDropdown.trailingAnchor.constraint(equalTo: helpDropdown.trailingAnchor),
            goodAtDropdown.heightAnchor.constraint(equalTo: helpDropdown.heightAnchor),
            
            experienceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            experienceLabel.topAnchor.constraint(equalTo: goodAtDropdown.bottomAnchor, constant: 20.autoSized),
            
            experienceLabelView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 10.autoSized),
            experienceLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            experienceLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            experienceLabelView.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            subtractButton.topAnchor.constraint(equalTo: experienceLabelView.topAnchor),
            subtractButton.leadingAnchor.constraint(equalTo: experienceLabelView.leadingAnchor),
            subtractButton.bottomAnchor.constraint(equalTo: experienceLabelView.bottomAnchor),
            subtractButton.widthAnchor.constraint(equalTo: experienceLabelView.heightAnchor),
            
            addButton.topAnchor.constraint(equalTo: experienceLabelView.topAnchor),
            addButton.trailingAnchor.constraint(equalTo: experienceLabelView.trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: experienceLabelView.bottomAnchor),
            addButton.widthAnchor.constraint(equalTo: experienceLabelView.heightAnchor),
          
            experienceValueLabel.centerXAnchor.constraint(equalTo: experienceLabelView.centerXAnchor),
            experienceValueLabel.centerYAnchor.constraint(equalTo: experienceLabelView.centerYAnchor),
            
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            locationLabel.topAnchor.constraint(equalTo: experienceLabelView.bottomAnchor, constant: 20.autoSized),
            
            locationView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10.autoSized),
            locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.widthRatio),
            locationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.widthRatio),
            locationView.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            locationButton.topAnchor.constraint(equalTo: locationView.topAnchor),
            locationButton.trailingAnchor.constraint(equalTo: locationView.trailingAnchor),
            locationButton.bottomAnchor.constraint(equalTo: locationView.bottomAnchor),
            locationButton.widthAnchor.constraint(equalTo: locationView.heightAnchor),

            nextButton.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 40.autoSized),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.widthRatio),
            nextButton.widthAnchor.constraint(equalToConstant: 100.widthRatio),
            nextButton.heightAnchor.constraint(equalToConstant: 50.autoSized),
            
            backButton.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor),
            backButton.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -16.widthRatio),
        ])
    }
    
    private func updateSubtractButtonState() {
        if experienceValue <= 0 {
            subtractButton.isEnabled = false
            subtractButton.alpha = 0.5
        } else {
            subtractButton.isEnabled = true
            subtractButton.alpha = 1.0
        }
    }
    
    @objc private func subtractButtonTapped() {
            experienceValue -= 1
    }

    @objc private func addButtonTapped() {
        experienceValue += 1
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonTapped() {
        // Handle next button actions
//        print("Things you need help with: \(helpDropdown.selectedValue ?? "")")
//        print("Things you are good at: \(goodAtDropdown.selectedValue ?? "")")
        self.navigationController?.pushViewController(PersonalDetailsViewController(), animated: true)
    }
}
