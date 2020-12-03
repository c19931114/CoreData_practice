//
//  ThirdViewController.swift
//  DemoApp
//
//  Created by 劉良瑋 on 2020/12/3.
//

import UIKit

class ThirdViewController: BaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(with apiData: APIDataTable) {
        super.init(nibName: nil, bundle: nil)
        imageView.load(urlString: apiData.thumbnailUrl ?? "", id: Int(apiData.id))
        idLabel.text = "id: \(apiData.id)"
        titleLabel.text = "title: \(apiData.title ?? "")"
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(idLabel)
        view.addSubview(titleLabel)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        idLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
