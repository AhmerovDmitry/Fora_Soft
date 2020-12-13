//
//  CollectionViewCell.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 09.12.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Properties
    let titleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    let artistName: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.boldSystemFont(ofSize: 10)
        text.backgroundColor = .white
        text.textAlignment = .center
        text.numberOfLines = 0
        text.textColor = .lightGray
        
        return text
    }()
    let artistAlbumName: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 13)
        text.backgroundColor = .white
        text.textAlignment = .center
        text.numberOfLines = 0
        
        return text
    }()
    
    // MARK: - Init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        [titleImage, artistName, artistAlbumName].forEach({ contentView.addSubview($0) })
        
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleImage.heightAnchor.constraint(equalTo: titleImage.widthAnchor),
            
            artistName.topAnchor.constraint(equalTo: titleImage.bottomAnchor),
            artistName.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            artistName.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            artistName.heightAnchor.constraint(equalToConstant: (contentView.bounds.height - contentView.bounds.width) / 2),
            
            artistAlbumName.topAnchor.constraint(equalTo: artistName.bottomAnchor),
            artistAlbumName.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            artistAlbumName.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            artistAlbumName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // Method for update cell information (titleImage, artistName, artistAlbumName)
    func updateCellData (album: Album?) {
        guard let image = album?.artworkUrl100 else { return }
        guard let imageUrl = URL(string: image) else { return }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.titleImage.image = UIImage(data: imageData)
                    self.artistName.text = album?.artistName
                    self.artistAlbumName.text = album?.collectionName
                }
            }
        }
        
    }
    
    // Image will be assigned nil for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleImage.image = nil
    }
    
    // MARK: - Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented CollectionViewCell")
    }
    
}
