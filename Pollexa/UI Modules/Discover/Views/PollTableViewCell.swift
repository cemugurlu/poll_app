//
//  PollView.swift
//  Pollexa
//
//  Created by Cem Uğurlu on 9.06.2024.
//

import UIKit

class PollTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        return view
    }()
    
    // MARK: - Properties
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
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
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.opacity = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private let option1PercentageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let option2PercentageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        contentView.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(contentLabel)
        containerView.addSubview(option1ImageView)
        containerView.addSubview(option2ImageView)
        containerView.addSubview(option1PercentageLabel)
        containerView.addSubview(option2PercentageLabel)
        containerView.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: timeLabel.leadingAnchor, constant: -8),
            
            timeLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            contentLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            dividerView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            dividerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            dividerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            option1ImageView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 8),
            option1ImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            option1ImageView.widthAnchor.constraint(equalToConstant: 100),
            option1ImageView.heightAnchor.constraint(equalToConstant: 100),
            
            option2ImageView.topAnchor.constraint(equalTo: option1ImageView.topAnchor),
            option2ImageView.leadingAnchor.constraint(equalTo: option1ImageView.trailingAnchor, constant: 8),
            option2ImageView.widthAnchor.constraint(equalTo: option1ImageView.widthAnchor),
            option2ImageView.heightAnchor.constraint(equalTo: option1ImageView.heightAnchor),
            option2ImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            option1PercentageLabel.trailingAnchor.constraint(equalTo: option1ImageView.trailingAnchor, constant: -8),
            option1PercentageLabel.bottomAnchor.constraint(equalTo: option1ImageView.bottomAnchor, constant: -8),

            option2PercentageLabel.trailingAnchor.constraint(equalTo: option2ImageView.trailingAnchor, constant: -8),
            option2PercentageLabel.bottomAnchor.constraint(equalTo: option2ImageView.bottomAnchor, constant: -8),

            
            option2ImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuration
    func configure(with post: Post) {
        nameLabel.text = post.user.username
        timeLabel.text = post.createdAt.timeAgoDisplay()
        contentLabel.text = post.content
        profileImageView.image = post.user.image
        option1ImageView.image = post.options[0].image
        option2ImageView.image = post.options[1].image
        option1PercentageLabel.text = "\(post.options[0].percentage)%"
        option2PercentageLabel.text = "\(post.options[1].percentage)%"
    }
}

