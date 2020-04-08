//
//  HighlightViewController.swift
//  ShortcutExample
//
//  Created by Chrystian on 08/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class HighlightViewController: UIViewController {
    
    var delegate: FirstViewControllerDelegate?
    
    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        
        return label
    }()
    
    lazy var countButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Count", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(actionCountButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("voltar", for: .normal)
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
        
        view.backgroundColor = .white
        
        let buttons = [label, countButton, button]
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
        delegate?.navigateToRoot()
    }
    
    @objc private func actionCountButton() {
        if let _text = label.text, var _number = Int(_text) {
            _number += 1
            label.text = "\(_number)"
        }
    }
}

