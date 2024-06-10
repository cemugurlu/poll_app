//
//  ActivePollsView.swift
//  Pollexa
//
//  Created by Cem Uğurlu on 9.06.2024.
//

import UIKit

class ActivePollsView: UIView {
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "2 Active Polls"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let detailsSubtitle: UILabel = {
        let label = UILabel()
        label.text = "See Details"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        imageView.tintColor = .white
        return imageView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup View
    private func setupView() {
        backgroundColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1.0)
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(detailsSubtitle)
        addSubview(arrowImageView)
        
        // Set Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsSubtitle.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            // Details Button Constraints
            detailsSubtitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            detailsSubtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            // Arrow ImageView Constraints
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
}

