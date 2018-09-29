//
//  CreateFishViewController.swift
//  plasticfishes-mvc
//
//  Created by Luis Ezcurdia on 9/27/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class CreateFishViewController: UIViewController {
    let fishView: FishFormView = {
        let view = FishFormView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save,
                                               target: nil, action: #selector(create(_:)))

    let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,
                                       target: nil, action: #selector(cancel(_:)))

    lazy var navBar: UINavigationBar = {
        let navBar: UINavigationBar = UINavigationBar(frame: .zero)
        let navItem = UINavigationItem(title: "Create Fish")
        navItem.leftBarButtonItem = cancelButton
        navItem.rightBarButtonItem = saveButton
        navBar.setItems([navItem], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAutoLayout()
    }

    func setupAutoLayout() {
        view.backgroundColor = .white
        self.view.addSubview(navBar)
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 44)
            ])

        self.view.addSubview(fishView)
        NSLayoutConstraint.activate([
            fishView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor),
            fishView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            fishView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            fishView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc func create(_ sender: Any) {
        // Perform Save Action
        // try? fishView.getObject()
        // FishService.shared.create(fishView.fish) { data in
        dismiss(animated: true, completion: nil)
        // }
    }

    @objc func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
