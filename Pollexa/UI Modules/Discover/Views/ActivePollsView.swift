//
//  ActivePollsView.swift
//  Pollexa
//
//  Created by Cem Uğurlu on 9.06.2024.
//

import UIKit

class ActivePollsView: UIView {
    
    // MARK: - Properties
    private let backgroundContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1.0)
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "2 Active Polls"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let detailsSubtitle: UILabel = {
        let label = UILabel()
        label.text = "See Details"
        label.textColor = .white
        label.layer.opacity = 0.5
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let arrowContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        imageView.tintColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1.0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(backgroundContainerView)
        
        backgroundContainerView.addSubview(titleLabel)
        backgroundContainerView.addSubview(detailsSubtitle)
        backgroundContainerView.addSubview(arrowContainerView)
        arrowContainerView.addSubview(arrowImageView)
        
        backgroundContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsSubtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    backgroundContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -5),
                    backgroundContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
                    backgroundContainerView.topAnchor.constraint(equalTo: topAnchor, constant: -5),
                    backgroundContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
                    
                    // Title Label Constraints
                    titleLabel.topAnchor.constraint(equalTo: backgroundContainerView.topAnchor, constant: 15),
                    titleLabel.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 20),
                    
                    // Details Subtitle Constraints
                    detailsSubtitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                    detailsSubtitle.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 20),
                    
                    // Arrow Container View Constraints
                    arrowContainerView.centerYAnchor.constraint(equalTo: backgroundContainerView.centerYAnchor),
                    arrowContainerView.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -20),
                    arrowContainerView.widthAnchor.constraint(equalToConstant: 30),
                    arrowContainerView.heightAnchor.constraint(equalToConstant: 30),
                    
                    // Arrow ImageView Constraints
                    arrowImageView.centerXAnchor.constraint(equalTo: arrowContainerView.centerXAnchor),
                    arrowImageView.centerYAnchor.constraint(equalTo: arrowContainerView.centerYAnchor),
                    arrowImageView.widthAnchor.constraint(equalToConstant: 20),
                    arrowImageView.heightAnchor.constraint(equalToConstant: 20)
                ])
    }
}

