//
//  DropDownField.swift
//  VibeVersaProject
//
//  Created by Ali on 01/12/2024.
//

import Foundation
import UIKit

class DropdownField: UIView {

    private var options: [String] = []
    private var pickerView = UIPickerView()
    private var toolbar: UIToolbar?
    private var selectedOption: String?
    
    private let label = Label(texttitle: "----------- Select -----------", textcolor: .black, font: .systemFont(ofSize: 18), numOflines: 0, textalignment: .center)
    
    private let borderView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.autoSized
        view.layer.cornerRadius = 5.autoSized
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    init(options: [String]) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5.autoSized
        self.backgroundColor = .darkBeige
        self.options = options
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(borderView)
        borderView.addSubview(label)


        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -10),
        ])
        
        // Add tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapDropdown))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapDropdown() {
        // Show UIPickerView
        showPicker()
    }
    
    private func showPicker() {
        // Configure pickerView
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .white

        // Create toolbar with Done button
        toolbar = UIToolbar()
        toolbar?.sizeToFit()
        toolbar?.translatesAutoresizingMaskIntoConstraints = false
        toolbar?.barTintColor = .white
        toolbar?.tintColor = .brown

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didSelectOption))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar?.setItems([spacer, doneButton], animated: false)

        // Present pickerView in an inputView
        let textField = UITextField(frame: .zero)
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
        addSubview(textField)
        textField.becomeFirstResponder()
    }
    
    @objc private func didSelectOption() {
        // Set the selected option and update label
        if let index = pickerView.selectedRow(inComponent: 0) as Int?, index < options.count {
            selectedOption = options[index]
            label.text = selectedOption
        } else {
            selectedOption = nil
            label.text = "----------- Select -----------"
        }
        
        // Dismiss pickerView
        superview?.endEditing(true)
    }
    
    var selectedValue: String? {
        return selectedOption
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension DropdownField: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
}
