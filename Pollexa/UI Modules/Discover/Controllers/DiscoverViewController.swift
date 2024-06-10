//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

class DiscoverViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    private let postProvider = PostProvider.shared
    private let tableView = UITableView()
    private let headerLabel = UILabel()
    private let addButton = UIButton(type: .system)
    private let activePollsView = ActivePollsView()
    
    // MARK: - Sample Post Data
    private var posts: [Post] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        fetchPosts()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        // Setup Profile Photo Button
        let profilePhotoButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(named: "avatar_1")?.withRenderingMode(.alwaysOriginal), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(profilePhotoButtonTapped), for: .touchUpInside)
            button.layer.cornerRadius = 50
            button.clipsToBounds = true
            
            return button
        }()
        
        let profileHeaderStackView = UIStackView()
        profileHeaderStackView.axis = .vertical
        profileHeaderStackView.alignment = .leading
        profileHeaderStackView.spacing = 8 // Set vertical spacing between the elements
        profileHeaderStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderStackView)
        
        profileHeaderStackView.addArrangedSubview(profilePhotoButton)
        profileHeaderStackView.addArrangedSubview(headerLabel)
        
        headerLabel.text = "Discover"
        headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        activePollsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activePollsView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            profileHeaderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            addButton.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 30),
            
            activePollsView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            activePollsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            activePollsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            activePollsView.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.topAnchor.constraint(equalTo: activePollsView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PollTableViewCell.self, forCellReuseIdentifier: "postCell")
    }
    
    private func fetchPosts() {
        postProvider.fetchAll { [weak self] result in
            switch result {
            case .success(let fetchedPosts):
                self?.posts = fetchedPosts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching posts: \(error)")
            }
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PollTableViewCell else {
            fatalError("Failed to dequeue PostTableViewCell")
        }
        
        cell.configure(with: posts[indexPath.row])
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection
    }
    
    // MARK: - Action
    @objc private func profilePhotoButtonTapped() {
        // Handle profile photo button tap
    }
}
