//
//  PollView.swift
//  Pollexa
//
//  Created by Cem Uğurlu on 9.06.2024.
//

import UIKit

class PollTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let option1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let option2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    // MARK: - Setup Subviews
    private func setupSubviews() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(timeLabel)
        addSubview(contentLabel)
        addSubview(option1ImageView)
        addSubview(option2ImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            option1ImageView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            option1ImageView.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            option1ImageView.widthAnchor.constraint(equalToConstant: 100),
            option1ImageView.heightAnchor.constraint(equalToConstant: 100),
            
            option2ImageView.topAnchor.constraint(equalTo: option1ImageView.topAnchor),
            option2ImageView.leadingAnchor.constraint(equalTo: option1ImageView.trailingAnchor, constant: 8),
            option2ImageView.widthAnchor.constraint(equalTo: option1ImageView.widthAnchor),
            option2ImageView.heightAnchor.constraint(equalTo: option1ImageView.heightAnchor),
            option2ImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            option2ImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuration
    func configure(with post: Post) {
        nameLabel.text = post.user.username
        timeLabel.text = DateFormatter.localizedString(from: post.createdAt, dateStyle: .medium, timeStyle: .short)
        contentLabel.text = post.content
        profileImageView.image = post.user.image
        option1ImageView.image = post.options[0].image
        option2ImageView.image = post.options[1].image
    }
}
