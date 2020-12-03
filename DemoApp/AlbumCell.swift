//
//  AlbumCell.swift
//  DemoApp
//
//  Created by 劉良瑋 on 2020/12/2.
//

import UIKit

// cache reference:
// https://medium.com/better-programming/cache-images-in-a-uicollectionview-using-nscache-in-swift-5-b70ebf090521

class AlbumCell: UICollectionViewCell {
//    private lazy var cache = NSCache<NSNumber, UIImage>()
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.addSubview(idLabel)
        imageView.addSubview(titleLabel)
        idLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        idLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    func configCell(with data: APIDataTable, index: Int) {
        idLabel.text = "\(data.id)"
        titleLabel.text = data.title
        guard let urlString = data.thumbnailUrl else { return }
        imageView.load(urlString: urlString, id: Int(data.id))
    }
}
