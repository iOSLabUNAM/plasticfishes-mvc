//
//  FishFormView.swift
//  plasticfishes-mvc
//
//  Created by Luis Ezcurdia on 9/27/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

enum ValidationError: Error {
    case required(String)
}

class FishFormView: UIView {
    private var fish: Fish? {
        didSet { setFields() }
    }

    let nameLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .left
        lbl.text = "Name"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let nameField: UITextField = {
        let view = UITextField(frame: .zero)
        view.borderStyle = .roundedRect
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let textLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .left
        lbl.text = "Description"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    lazy var textField: UITextView = {
        let view = UITextView(frame: .zero)
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.isScrollEnabled = true
        view.isEditable = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutolayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAutolayout()
    }

    func getObject() throws -> Fish {
        let fish = try validate()
        return fish
    }

    private func setupAutolayout() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 42)
            ])

        addSubview(nameField)
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 42)
            ])

        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 5),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textLabel.heightAnchor.constraint(equalToConstant: 42)
            ])

        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 128)
            ])
    }

    private func setFields() {
        nameField.text = fish?.name
        textField.text = fish?.text
    }

    private func validate() throws -> Fish {
        guard let fishName = nameField.text else {
            throw ValidationError.required("Fish name can not be blank")
        }
        guard let fishText = textField.text else {
            throw ValidationError.required("Fish text can not be blank")
        }
        return Fish(name: fishName, text: fishText)
    }

}
