//
//  TuneCell.swift
//  halfTune
//
//  Created by Гурген on 05.08.2021.
//

import UIKit

class TuneCell: UITableViewCell {
    
    static let reuseID = "TuneCell"
    
    var viewModel: TuneCellViewModel?
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Title"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var artistLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Artist"
        label.isEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var downloadButton: UIButton = {
       let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
       return button
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    var pauseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pause", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.tintColor = .red
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    var progressLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive = true
        
        contentView.addSubview(artistLabel)
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive = true
        artistLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        contentView.addSubview(cancelButton)
        cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        
        contentView.addSubview(pauseButton)
        pauseButton.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor).isActive = true
        pauseButton.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        
        cancelButton.centerYAnchor.constraint(equalTo: pauseButton.centerYAnchor).isActive = true
        
        contentView.addSubview(downloadButton)
        downloadButton.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
        
        contentView.addSubview(progressView)
        progressView.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 2).isActive = true
        progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive = true
        
        contentView.addSubview(progressLabel)
        progressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 9).isActive = true
        progressLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor, constant: 2).isActive = true
        
        progressLabel.trailingAnchor.constraint(equalTo: progressLabel.leadingAnchor).isActive = true
        
        pauseButton.leadingAnchor.constraint(equalTo: progressView.trailingAnchor).isActive = true
    }
    
    func configureUI() {
        titleLabel.text = viewModel?.title
        artistLabel.text = viewModel?.artist
    }
}

