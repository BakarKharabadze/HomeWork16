//
//  ArticleViewController.swift
//  imediApp
//
//  Created by Bakar Kharabadze on 4/19/24.
//

import UIKit

class ArticleViewController: UIViewController {
    // MARK: - Properties
    private let mainStackView = UIStackView()
    private let image = UIImageView()
    private let timelabel = UILabel()
    private let descriptionLabel = UILabel()
    private let textStackView = UIStackView()
    var news: News?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        set()
    }
    // MARK: - Setup
    private func set() {
        descriptionLabel.text = news?.title
        timelabel.text = news?.time
    }
    
    private func setup() {
        setupMainStackView()
        setupNavigationController()
        setupImage()
        setupTimeLabel()
        setupTextStackView()
        setupDescriptionLabel()
        
        mainStackView.setCustomSpacing(14, after: image)
    }
    
    private func setupNavigationController() {
        title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        
        mainStackView.axis = .vertical
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    private func setupImage() {
        image.widthAnchor.constraint(equalToConstant: 330).isActive = true
        image.heightAnchor.constraint(equalToConstant: 190).isActive = true
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "Placeholder")
        
        mainStackView.addArrangedSubview(image)
    }
    
    private func setupTimeLabel() {
        timelabel.textColor = .black
        timelabel.textAlignment = .right
        
        mainStackView.addArrangedSubview(timelabel)
    }
    
    private func setupTextStackView() {
        mainStackView.addArrangedSubview(textStackView)
        
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.isLayoutMarginsRelativeArrangement = true
        textStackView.axis = .vertical
        textStackView.layoutMargins = UIEdgeInsets(top: 26, left: 36, bottom: 0, right: 36)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        
        textStackView.addArrangedSubview(descriptionLabel)
    }
}

