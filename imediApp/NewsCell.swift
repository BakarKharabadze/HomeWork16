//
//  NewsCell.swift
//  imediApp
//
//  Created by Bakar Kharabadze on 4/19/24.
//

import UIKit

class NewsCell: UITableViewCell {
    
    // MARK: - Properties
    private let newsImage = UIImageView()
    private let timeLabel = UILabel()
    private let titleLabel = UILabel()
    private let separatorView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
        timeLabel.text = nil
        titleLabel.text = nil
    }
    
    // MARK: - Setup
    private func setup() {
        setupSeparatorView()
        setupNewsImage()
        setupTitleLabel()
        setupTimeLabel()
    }
    
    private func setupNewsImage() {
        addSubview(newsImage)
        
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        newsImage.bottomAnchor.constraint(equalTo: self.separatorView.topAnchor).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25).isActive = true
        newsImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 108).isActive = true
        newsImage.image = UIImage(named: "Placeholder")
        newsImage.contentMode = .scaleAspectFill
        newsImage.clipsToBounds = true
        newsImage.layer.cornerRadius = 14
    }
    
    private func setupTimeLabel() {
        addSubview(timeLabel)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .black
        timeLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 3
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 48).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -48).isActive = true
    }
    
    private func setupSeparatorView() {
        addSubview(separatorView)
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    func configure(with news: News) {
        newsImage.image = UIImage(named: "Placeholder")
        timeLabel.text = news.time
        titleLabel.text = news.title
    }
}
