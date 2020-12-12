//
//  DetailViewController.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 11.12.2020.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - UI Properties
    let titleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.borderWidth = 0.25
        image.layer.borderColor = UIColor.black.cgColor
        
        return image
    }()
    let artistAlbumName: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.textAlignment = .left
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.systemFont(ofSize: 15)
        text.numberOfLines = 2
        text.text = "Album Name"
        
        return text
    }()
    let artistName: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .lightGray
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 13)
        text.text = "Artist Name"
        
        return text
    }()
    let artistStyle: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 10)
        text.textColor = .lightGray
        text.textAlignment = .left
        text.adjustsFontSizeToFitWidth = true
        text.text = "Style"
        
        return text
    }()
    let trackCount: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 10)
        text.textColor = .lightGray
        text.textAlignment = .left
        text.adjustsFontSizeToFitWidth = true
        text.text = "Tracks Count"
        
        return text
    }()
    let releaseDate: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 10)
        text.textColor = .lightGray
        text.textAlignment = .left
        text.adjustsFontSizeToFitWidth = true
        text.text = "Release Date"
        
        return text
    }()
    // MARK: - UIStackView Properties
    let artistInfoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }()
    let albumInfoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }()
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupConstraints()
    }
    func setupConstraints() {
        // MARK: - ArtinsInfoStack constraints
        [artistAlbumName, artistName].forEach({ artistInfoStack.addArrangedSubview($0) })
        NSLayoutConstraint.activate([
            artistAlbumName.topAnchor.constraint(equalTo: artistInfoStack.topAnchor),
            artistAlbumName.leftAnchor.constraint(equalTo: artistInfoStack.leftAnchor),
            
            artistName.topAnchor.constraint(equalTo: artistAlbumName.bottomAnchor),
            artistName.leftAnchor.constraint(equalTo: artistInfoStack.leftAnchor)
        ])
        // MARK: - AlbumInfoStack constraints
        [artistStyle, trackCount, releaseDate].forEach({ albumInfoStack.addArrangedSubview($0) })
        NSLayoutConstraint.activate([
            artistStyle.bottomAnchor.constraint(equalTo: trackCount.topAnchor),
            artistStyle.leftAnchor.constraint(equalTo: albumInfoStack.leftAnchor),
            
            trackCount.bottomAnchor.constraint(equalTo: releaseDate.topAnchor),
            trackCount.leftAnchor.constraint(equalTo: albumInfoStack.leftAnchor),
            
            releaseDate.bottomAnchor.constraint(equalTo: albumInfoStack.bottomAnchor),
            releaseDate.leftAnchor.constraint(equalTo: albumInfoStack.leftAnchor)
        ])
        // MARK: - UIStackView and UI constraints
        [titleImage, artistInfoStack, albumInfoStack].forEach({ view.addSubview($0) })
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            titleImage.widthAnchor.constraint(equalToConstant: view.bounds.width / 3),
            titleImage.heightAnchor.constraint(equalTo: titleImage.widthAnchor),
            
            artistInfoStack.topAnchor.constraint(equalTo: titleImage.topAnchor),
            artistInfoStack.leftAnchor.constraint(equalTo: titleImage.rightAnchor, constant: 10),
            artistInfoStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            artistInfoStack.heightAnchor.constraint(lessThanOrEqualTo: titleImage.heightAnchor, multiplier: 0.5),
            
            albumInfoStack.bottomAnchor.constraint(equalTo: titleImage.bottomAnchor),
            albumInfoStack.leftAnchor.constraint(equalTo: titleImage.rightAnchor, constant: 10),
            albumInfoStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
    
}
