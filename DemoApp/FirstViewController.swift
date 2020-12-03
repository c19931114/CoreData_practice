//
//  FirstViewController.swift
//  DemoApp
//
//  Created by 劉良瑋 on 2020/12/1.
//

import UIKit

class FirstViewController: BaseViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "JSON Placeholder"
        //        label.text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Request API", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(button)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -24).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    @objc private func buttonTapped() {
        print("buttonTapped")
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
        let httpClient = HTTPClient()
        httpClient.fetchAPIData { (datas, error) in
            if let datas = datas {
                for data in datas {
                    DBManager.shared.update(with: data)
                }
            }
        }
    }
}
