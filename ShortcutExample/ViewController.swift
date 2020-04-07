//
//  ViewController.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate: class {
    func navigate()
}

class ViewController: UIViewController {
    
    var delegate: FirstViewControllerDelegate?
    
    lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Navegar", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        
        return button
    }()
    
    
    lazy private var stackView: UIStackView = {
        let skView = UIStackView(frame: .zero)
        skView.axis = .vertical
        skView.translatesAutoresizingMaskIntoConstraints = false
        skView.spacing = 8
        
        return skView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [button]
        view.addSubview(stackView)
        
        buttons.forEach { (button) in
            stackView.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 44)
            ])
        }
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }

    @objc private func actionButton() {
        delegate?.navigate()
    }
}

